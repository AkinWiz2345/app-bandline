FROM ruby:2.5.3
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /app-bandline

ADD Gemfile /app-bandline/Gemfile
ADD Gemfile.lock /app-bandline/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /app-bandline