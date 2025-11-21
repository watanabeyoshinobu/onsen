FROM nginx:1.24.0

RUN apt-get update && apt-get install -y apt-transport-https && \
    apt-get clean && apt-get update && \
    apt-get install -y apt-utils locales && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8

ENV LC_ALL=ja_JP.UTF-8

RUN rm -f /etc/nginx/conf.d/default.conf

COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
