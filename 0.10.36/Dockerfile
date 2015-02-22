# AUTHOR:         Joshua Mervine <joshua@mervine.net>
# DESCRIPTION:    Minimal Node.js Image using Busybox
FROM progrium/busybox
MAINTAINER Joshua Mervine <joshua@mervine.net>

# thanks to -- and forked from:
# MAINTAINER Harald Westphal <h.westphal@gmx.de>
# -> https://github.com/hwestphal/docker-nodebox

ENV NODE_VERSION=0.10.36

RUN \
  opkg-install curl bash git libstdcpp && \
  rm -f /lib/libpthread.so.0 && \
  ln -s /lib/libpthread-2.18.so /lib/libpthread.so.0 && \
  curl -s http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz | gunzip | tar -xf - -C /

ENV PATH /node-v${NODE_VERSION}-linux-x64/bin:$PATH

CMD ["/bin/bash"]
