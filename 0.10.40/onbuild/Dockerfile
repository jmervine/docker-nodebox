# AUTHOR:         Joshua Mervine <joshua@mervine.net>
# DESCRIPTION:    Minimal Node.js Image using Busybox
FROM jmervine/nodebox:0.10.40
MAINTAINER Joshua Mervine <joshua@mervine.net>

ENV NODE_VERSION=0.10.40
ENV NODE_PATH=/src

RUN mkdir -v $NODE_PATH
WORKDIR $NODE_PATH

ONBUILD COPY package.json ${NODE_PATH}/
ONBUILD RUN  npm install
ONBUILD COPY . ${NODE_PATH}

CMD ["npm", "start"]
