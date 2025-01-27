from celery import shared_task
import logging


logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
)
logger = logging.getLogger(__name__)


@shared_task
def add(x, y):
    logger.info(f"Trying to sum two elems  {x} + {y}")
    return x + y