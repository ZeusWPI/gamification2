FROM ruby:3.1.2

RUN mkdir /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn cmake

RUN gem install bundler
WORKDIR /app

COPY . .
RUN bundle

RUN bundle exec rails assets:precompile

CMD bundle exec rails db:prepare && bundle exec unicorn -c config/unicorn.rb
