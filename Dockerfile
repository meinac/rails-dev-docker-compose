FROM ruby:2.6.3-alpine

COPY build-deps /
RUN apk update && cat build-deps | xargs apk add --virtual build-dependencies

RUN mkdir /rails
WORKDIR /rails

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

COPY ./rails/. ./
RUN bundle install --jobs 20 --retry 5
