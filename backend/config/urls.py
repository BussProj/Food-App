from django.urls import path, include

urlpatterns = [
    # Health checks endpoint
    path('api/health/', include('apps.health.urls')),
]
