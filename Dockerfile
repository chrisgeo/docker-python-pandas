################
# Base Development file Development Docker File
################
FROM python:2-slim

RUN apt-get update && \
  apt-get install -y build-essential \
    libmysqlclient-dev \
    postgresql-server-dev-all \
    mysql-client \
    redis-tools \
    libxml2-dev \
    libxslt-dev \
  && pip install --no-cache-dir pandas gunicorn eventlet gevent Fabric lxml urllib3 \
  && rm -rf $HOME/.cache \
  && apt-get purge -y python.* \
  && apt-get autoremove -y \
  && apt-get clean
