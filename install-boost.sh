#!/bin/bash -e

boost_version="${1}"
boost_file=$(echo ${boost_version} | tr '.' '_')

cd /opt
wget https://dl.bintray.com/boostorg/release/${boost_version}/source/boost_${boost_file}.tar.bz2
tar -xf boost_${boost_file}.tar.bz2
rm -f boost_${boost_file}.tar.bz2
cd boost_${boost_file}
./bootstrap.sh --prefix=/opt/local --with-libraries=system
./b2 -j3 --prefix=/opt/local threading=multi variant=release optimization=space install
cd /opt
rm -fr /opt/boost_${boost_file}
