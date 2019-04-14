FROM buildpack-deps:jessie-curl
MAINTAINER Mario Konrad <mario.konrad@gmx.net>

ARG cmake_version=3.13.4

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends --no-install-suggests tar xz-utils bzip2 \
 && apt-get install -y make flex gcc g++

# gcc
COPY download-gcc.sh /tmp
COPY install-gcc.sh /tmp
RUN /tmp/download-gcc.sh /tmp/cache
RUN /tmp/install-gcc.sh /tmp/cache /opt/build /opt/local
RUN rm -fr /tmp/cache /tmp/gcc /tmp/build-gcc.sh
ENV PATH /opt/local/bin:$PATH

# install cmake
COPY install-cmake.sh /tmp/
RUN /tmp/install-cmake.sh "${cmake_version}"
ENV PATH /opt/local/cmake/bin:$PATH

# add user
RUN useradd --groups users -M --uid 1000 user
USER user
