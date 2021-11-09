FROM ruby:3.0-alpine

RUN apk add --no-cache build-base

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN gem install bundler

RUN bundle config set deployment 'true'
RUN bundle install --jobs $(nproc)

ARG APP_REVISION
ENV APP_REVISION ${APP_REVISION}

COPY . ./

EXPOSE 4567
