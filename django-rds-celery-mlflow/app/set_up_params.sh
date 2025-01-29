#!/bin/bash -ex

pulumi config set sql-admin-name $USER_NAME
pulumi config set sql-admin-password $USER_PASSWORD --secret
pulumi config set sql-user-name  $DB_USER_NAME
pulumi config set sql-user-password $DB_USER_PASSWORD --secret
pulumi config set sql-database-name $DATABASE_NAME
pulumi config set django-admin-name $DJANGO_NAME
pulumi config set django-admin-password $DJANGO_PASSWORD --secret
pulumi config set redis-port $REDIS_PORT


