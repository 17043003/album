FROM ruby:2.7.1

ENV LANG C.UTF-8
ENV APP_ROOT /usr/src/api

WORKDIR $APP_ROOT

RUN set -ex && \
    apt-get update -qq && \
    apt-get install -y apt-utils build-essential libpq-dev nodejs libappindicator1 fonts-liberation libappindicator3-1 libasound2 libnspr4 libnss3 libxss1 xdg-utils &&     apt-get update -qq && \
    apt-get install -y sudo && \
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&     apt-get update -qq && \
    apt-get install -y yarn
    
RUN gem install rails --version="~>6.0.0"

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
RUN yarn install

COPY . $APP_ROOT

EXPOSE 3000

COPY ./entrypoint.sh /usr/src/api/entrypoint.sh
RUN chmod 755 /usr/src/api/entrypoint.sh
CMD ["/usr/src/api/entrypoint.sh"]
