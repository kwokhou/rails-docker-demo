FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential

# for Postgres
RUN apt-get install -y libpq-dev

# for sqlite3
RUN apt-get install -y libsqlite3-dev sqlite3 

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev 

# for capybara webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for openssl
RUN apt-get install -y libssl-dev libcurl4-openssl-dev 

# for gzip
RUN apt-get install -y zlib1g-dev 

# misc stuff to get rails runs properly
RUN apt-get install -y libreadline-dev libyaml-dev libffi-dev python-software-properties

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myap
