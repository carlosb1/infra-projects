FROM python:3.10-slim

WORKDIR /

EXPOSE 80

RUN apt-get update && \
    apt install -y gcc python3-dev python3-pip default-mysql-client-core default-mysql-client default-libmysqlclient-dev pkg-config

ADD requirements.txt /

# install reqs
RUN pip3 install -r requirements.txt

# set up migrations
ADD . /app

CMD [ "python3", "/app/manage.py", "runserver", "0.0.0.0:80" ]