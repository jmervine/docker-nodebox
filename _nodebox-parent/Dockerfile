# AUTHOR:         Joshua Mervine <joshua@mervine.net>
# DESCRIPTION:    Parent Busybox Image for jmervine/nodebox
FROM progrium/busybox
MAINTAINER Joshua Mervine <joshua@mervine.net>

RUN \
  opkg-install curl bash git libstdcpp && \
  rm -f /lib/libpthread.so.0 && \
  ln -s /lib/libpthread-2.18.so /lib/libpthread.so.0

CMD ["/bin/bash"]
