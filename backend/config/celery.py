import os
from celery import Celery

# Set default settings module
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.local')

app = Celery('config')

# Load task sources from Django settings using namespace 'CELERY'
app.config_from_object('django.conf:settings', namespace='CELERY')

# Auto-discover task modules in all installed Django apps
app.autodiscover_tasks()
