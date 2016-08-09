################
# Base Development file Development Docker File
################
FROM python:2-alpine

RUN apk add --no-cache \
            --virtual \
            .build-deps \
            python-dev \
            g++ \
            linux-headers \
            build-base \
  && apk add --no-cache \
              --virtual \
              .runtime-deps \
              ca-certificates \
              bash \
              openssh \
              git \
              mariadb-dev \
              postgresql-dev \
              libxml2-dev \
              libxslt-dev \
  && ln -s /usr/include/locale.h /usr/include/xlocale.h \
  && pip install pandas==0.18.1 \
  && apk del python python-dev \
  && rm -rf .cache \
  && rm -rf /var/cache/apk/*

