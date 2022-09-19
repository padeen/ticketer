FROM ruby:3.1.2

COPY Gemfile* /usr/src/app/

WORKDIR /usr/src/app

RUN bundle install

CMD ["bin/rails", "s", "-b", "0.0.0.0"]