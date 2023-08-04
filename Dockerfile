FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y curl

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com
RUN apt-get update -qq && apt-get install -y \
                              postgresql-client \
                              yarn \
                              nodejs \
                              tzdata

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN yarn install --check-files