#!/bin/bash
set -ex
#set -euxo pipefail


echo "loading django password $DJANGO_PASSWORD and user $DJANGO_NAME"
echo "database name $DATABASE_NAME"


export DJANGO_SUPERUSER_PASSWORD=$DJANGO_PASSWORD
export DJANGO_SUPERUSER_USERNAME=$DJANGO_NAME
export DJANGO_SUPERUSER_EMAIL=$DJANGO_NAME@example.com

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py createsuperuser --no-input