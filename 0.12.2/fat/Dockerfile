# AUTHOR:         Joshua Mervine <joshua@mervine.net>
# DESCRIPTION:    Minimal Node.js Image using Busybox
#FROM debian:jessie
FROM debian:wheezy
MAINTAINER Joshua Mervine <joshua@mervine.net>

RUN \
  apt-get update && \
  apt-get install -y python make libc6-dev gcc g++ curl git && \
  curl -s http://nodejs.org/dist/v0.12.2/node-v0.12.2-linux-x64.tar.gz | gunzip -c | tar -xf - -C / && \
  apt-get autoremove -y

ENV NODE_VERSION=0.12.2
ENV NODE_PATH=/src
ENV PATH /node-v0.12.2-linux-x64/bin:$PATH

RUN mkdir -v $NODE_PATH
WORKDIR $NODE_PATH

ONBUILD COPY package.json ${NODE_PATH}/
ONBUILD RUN  npm install
ONBUILD COPY . ${NODE_PATH}

CMD ["npm", "start"]
