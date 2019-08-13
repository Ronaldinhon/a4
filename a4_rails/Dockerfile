FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

ENV RAILS_ENV production
ENV RACK_ENV production

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

RUN bundle exec rake assets:precompile

COPY . .

LABEL maintainer="Nick Janetakis <nick.janetakis@gmail.com>"

CMD puma -C config/puma.rb 
