from __future__ import absolute_import, unicode_literals
import os
from celery import Celery

redis_host = os.getenv('REDIS_HOST', default='0.0.0.0')
redis_port = os.getenv('REDIS_PORT', default='6379')

celery_broker_url = f'redis://{redis_host}:{redis_port}/0'
celery_result_backend = celery_broker_url
# Celery settings

# Initialize Celery
app = Celery('worker', broker=celery_broker_url)

app.conf.update(
    result_backend=celery_result_backend,
    task_serializer='json',
    accept_content=['json'],
    result_serializer='json',
)

#app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks(['documents'], related_name='tasks', force=True)
