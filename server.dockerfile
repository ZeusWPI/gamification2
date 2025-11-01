FROM ruby:3.4.7

RUN mkdir /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn cmake

RUN gem install bundler
WORKDIR /app

COPY . .
RUN bundle

RUN yarn install

RUN bundle exec rails assets:precompile

CMD bundle exec rails db:prepare && bundle exec rails server
