FROM bitnami/minideb:buster-snapshot-20210425T215215Z AS builder

ARG SRC_PKG_URL=https://github.com/breuner/elbencho/archive/refs/tags/v1.8-1.tar.gz

RUN install_packages \
      build-essential \
      curl \
      debhelper \
      devscripts \
      fakeroot \
      git \
      libaio-dev \
      libarchive-tools \
      libboost-filesystem-dev \
      libboost-program-options-dev \
      libboost-thread-dev \
      libncurses-dev \
      libnuma-dev \
      lintian

RUN mkdir -p /usr/local/elbencho && \
    curl -kL "${SRC_PKG_URL}" |bsdtar -xvf- -C /usr/local/elbencho --strip-components 1

RUN cd /usr/local/elbencho && \
    make -j && \
    make install && \
    make deb

FROM bitnami/minideb:buster-snapshot-20210425T215215Z
MAINTAINER https://github.com/breuner
LABEL packager="https://github.com/ug1yb0b"
COPY --from=builder /usr/local/elbencho/packaging/*.deb /root/
RUN install_packages /root/*.deb

ENTRYPOINT ["/usr/bin/elbencho"]
