
FROM ruby:3.1-slim

RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /rails

COPY Gemfile /rails/
COPY Gemfile.lock /rails/

RUN bundle install

COPY . /rails

RUN bundle exec rake assets:precompile RAILS_ENV=production SECRET_KEY_BASE=none

EXPOSE 3000