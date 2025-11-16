FROM nginx:1.20.1

RUN apt-get clean && apt-get update && \
    apt-get install -y apt-utils locales && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8

ENV LC_ALL=ja_JP.UTF-8 