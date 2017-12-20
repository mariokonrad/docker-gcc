FROM gcc:7.2.0

MAINTAINER Mario Konrad <mario.konrad@gmx.net>

ENV cmake_dir=3.10
ENV cmake_file=3.10.1

ENV boost_dir=1.65.1
ENV boost_file=1_65_1

RUN apt-get update && apt-get install -y \
	apt-utils \
	wget \
	git \
&& rm -fr /var/lib/apt/lists/*

RUN mkdir -p /opt

# install cmake
RUN cd /opt \
	&& wget https://cmake.org/files/v${cmake_dir}/cmake-${cmake_file}-Linux-x86_64.tar.gz \
	&& tar -xf cmake-${cmake_file}-Linux-x86_64.tar.gz \
	&& rm -f cmake-${cmake_file}-Linux-x86_64.tar.gz \
	&& ln -s /opt/cmake-${cmake_file}-Linux-x86_64/bin/cmake /usr/local/bin/cmake \
	&& ln -s /opt/cmake-${cmake_file}-Linux-x86_64/bin/cpack /usr/local/bin/cpack \
	&& ln -s /opt/cmake-${cmake_file}-Linux-x86_64/bin/ctest /usr/local/bin/ctest

# install boost
#RUN apt-get update && apt-get install -y libboost-all-dev
#RUN cd /opt \
#	&& wget https://dl.bintray.com/boostorg/release/${boost_dir}/source/boost_${boost_file}.tar.bz2 \
#	&& tar -xf boost_${boost_file}.tar.bz2 \
#	&& rm -f boost_${boost_file}.tar.bz2 \
#	&& cd boost_${boost_file} \
#	&& ./bootstrap.sh --prefix=/opt/local \
#	&& ./b2 -j2 --prefix=/opt/local threading=multi variant=release optimization=space install \
#	&& cd /opt \
#	&& rm -fr boost_${boost_file}

# install Qt5 development package
#RUN apt-get update && apt-get install -y libqt5*-dev

