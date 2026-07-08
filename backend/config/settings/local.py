from .base import *

# Databases configuration utilizing postgres-binary client
DATABASES = {
    'default': env.db(
        'DATABASE_URL',
        default='postgres://platform_admin:secure_postgres_developer_password@db:5432/restaurant_platform'
    )
}
