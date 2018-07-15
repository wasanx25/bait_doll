FROM ruby:2.5-alpine
ENV LANG C.UTF-8

RUN apk add --no-cache \
      build-base \
      libxml2-dev \
      libxslt-dev \
      nodejs \
      tzdata \
      yaml \
      yaml-dev \
      zlib-dev

ARG app_name
ENV deploy /var/www/$app_name

RUN mkdir -p $deploy
WORKDIR $deploy

COPY Gemfile $deploy/
COPY Gemfile.lock $deploy/

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
      gem install bundler && \
      bundle install
