FROM ruby:2.6-alpine
ENV LANG C.UTF-8

RUN apk --update add --no-cache git \
      && gem install danger -v 5.14.0

ENTRYPOINT ["danger"]

