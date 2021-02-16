FROM node:14.4.0-alpine

ARG CONTAINER_PORT
ARG HOME_DIR

RUN apk update     && apk upgrade     && apk add --no-cache bash     && apk add python make g++     && npm install -g npm     && npm install -g vue-cli     && npm install -g nuxt

ENV HOME=/${HOME_DIR}     LANG=C.UTF-8     TZ=Azia/Tokyo     HOST=0.0.0.0

WORKDIR ${HOME}

ADD . .

EXPOSE ${CONTAINER_PORT}
