import time
from django.db import connection
from django.utils.timezone import now
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class HealthCheckView(APIView):
    authentication_classes = []
    permission_classes = []

    def get(self, request, *args, **kwargs):
        health_data = {
            "status": "success",
            "timestamp": now().isoformat(),
            "services": {}
        }
        overall_healthy = True

        # 1. Verify PostgreSQL Database latency
        db_status = "connected"
        db_latency = 0.0
        try:
            start_time = time.time()
            with connection.cursor() as cursor:
                cursor.execute("SELECT 1;")
                cursor.fetchone()
            db_latency = (time.time() - start_time) * 1000.0
        except Exception as e:
            db_status = "failed"
            overall_healthy = False
            health_data["services"]["database_error"] = str(e)

        health_data["services"]["database"] = {
            "status": db_status,
            "latency_ms": round(db_latency, 2) if db_status == "connected" else None
        }

        # 2. Verify Redis cache ping latency
        redis_status = "connected"
        redis_latency = 0.0
        try:
            import redis
            from django.conf import settings
            start_time = time.time()
            
            # Parse connection URL from core base settings
            client = redis.from_url(settings.REDIS_URL)
            client.ping()
            
            redis_latency = (time.time() - start_time) * 1000.0
        except Exception as e:
            redis_status = "failed"
            overall_healthy = False
            health_data["services"]["redis_error"] = str(e)

        health_data["services"]["redis"] = {
            "status": redis_status,
            "latency_ms": round(redis_latency, 2) if redis_status == "connected" else None
        }

        if not overall_healthy:
            health_data["status"] = "error"
            return Response(health_data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response(health_data, status=status.HTTP_200_OK)
