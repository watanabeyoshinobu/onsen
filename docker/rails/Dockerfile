FROM ruby:2.5.7

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  vim \
  default-mysql-client \
  graphviz
RUN set -ex && \
  apt-get update -qq && \
  apt-get install -y sudo && \
  : "Install node.js" && \
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - && \
  apt-get update -qq && \
  apt-get install -y nodejs && \
  : "Install yarn" && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && \
  apt-get install -y yarn

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .

RUN gem install bundler && bundle install -j4

ADD . /app

WORKDIR .

RUN SECRET_KEY_BASE=placeholder bundle exec rails assets:precompile \
  && yarn cache clean \
  && rm -rf node_modules tmp/cache

EXPOSE 3000