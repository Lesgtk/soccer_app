FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

RUN mkdir /soccer_app
WORKDIR /soccer_app

ADD Gemfile /soccer_app/Gemfile
ADD Gemfile.lock /soccer_app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /soccer_app

RUN mkdir -p tmp/sockets
