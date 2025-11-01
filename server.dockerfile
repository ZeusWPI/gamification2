FROM ruby:3.4.7

RUN mkdir /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /etc/apt/keyrings/yarn-archive-keyring.gpg > /dev/null
RUN echo "deb [signed-by=/etc/apt/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn cmake

RUN gem install bundler
WORKDIR /app

COPY . .
RUN bundle

RUN yarn install

RUN bundle exec rails assets:precompile

CMD bundle exec rails db:prepare && bundle exec rails server
