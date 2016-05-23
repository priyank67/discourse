FROM ruby:2.3
MAINTAINER Zack Siri <zack@codemy.net>

RUN apt-get update
RUN apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev libgmp-dev

RUN bundle config build.nokogiri --use-system-libraries

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

RUN gem update bundler
RUN bundle install --path vendor/bundle --without development test doc --deployment --jobs=4