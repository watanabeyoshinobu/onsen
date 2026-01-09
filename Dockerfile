FROM ruby:3.0.6

# 必要なパッケージをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential default-libmysqlclient-dev nodejs

# 作業ディレクトリの設定
WORKDIR /app

# Gemfileをコピーしてインストール
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Bundlerを最新にしてインストール
RUN gem install bundler
RUN bundle install

# アプリのコードをすべてコピー
COPY . /app

# ポート3000を開ける
EXPOSE 3000

# サーバー起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]