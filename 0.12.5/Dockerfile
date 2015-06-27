# AUTHOR:         Joshua Mervine <joshua@mervine.net>
# DESCRIPTION:    Minimal Node.js Image using Busybox
FROM jmervine/nodebox-parent
MAINTAINER Joshua Mervine <joshua@mervine.net>

# thanks to -- and forked from:
# MAINTAINER Harald Westphal <h.westphal@gmx.de>
# -> https://github.com/hwestphal/docker-nodebox

ENV NODE_VERSION=0.12.5

RUN \
  curl -s http://nodejs.org/dist/v0.12.5/node-v0.12.5-linux-x64.tar.gz | gunzip -c | tar -xf - -C /

ENV PATH /node-v0.12.5-linux-x64/bin:$PATH

CMD ["/bin/bash"]
