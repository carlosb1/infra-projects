#!/bin/bash
set -euxo pipefail


echo "loading django password $DJANGO_PASSWORD"
echo "database name $DATABASE_NAME"


python3 manage.py makemigrations
python3 manage.py migrate
export DJANGO_SUPERUSER_PASSWORD=$DJANGO_PASSWORD
python3 manage.py createsuperuser \
    --no-input \
    --username=$DJANGO_NAME \
    --email=$DJANGO_NAME@example.com