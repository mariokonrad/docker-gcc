#!/bin/bash -ex

cache_dir=${1:-/tmp/cache}
build_dir=${2:-/tmp/build}
prefix_dir=${3:-/usr/local}

mkdir -p ${build_dir}
tar -C ${build_dir} --strip-components=1 -xf ${cache_dir}/gcc-9-20190407.tar.xz
tar -C ${build_dir} -xf ${cache_dir}/gmp-6.1.0.tar.bz2     && ln -s ${build_dir}/gmp-6.1.0  ${build_dir}/gmp
tar -C ${build_dir} -xf ${cache_dir}/isl-0.18.tar.bz2      && ln -s ${build_dir}/isl-0.18   ${build_dir}/isl
tar -C ${build_dir} -xf ${cache_dir}/mpc-1.0.3.tar.gz      && ln -s ${build_dir}/mpc-1.0.3  ${build_dir}/mpc
tar -C ${build_dir} -xf ${cache_dir}/mpfr-3.1.4.tar.bz2    && ln -s ${build_dir}/mpfr-3.1.4 ${build_dir}/mpfr

cd ${build_dir}
./configure \
	--prefix=${prefix_dir} \
	--enable-languages=c,c++ \
	--disable-multilib \
	--disable-bootstrap
make -j6
make install-strip
# echo "${prefix_dir}/lib64" > /etc/ld.so.conf.d/local-lib64.conf
# ldconfig -v
update-alternatives --install /usr/bin/gcc gcc ${prefix_dir}/bin/gcc 100
update-alternatives --install /usr/bin/g++ g++ ${prefix_dir}/bin/g++ 100
cd /
rm -fr ${build_dir}

# gdb
mkdir -p ${build_dir}
tar -C ${build_dir} --strip-components=1 -xf ${cache_dir}/gdb-8.2.tar.xz
cd ${build_dir}
ln -s /bin/true /usr/bin/makeinfo
./configure \
	--prefix=${prefix_dir} \
	--with-build-sysroot=${prefix_dir} \
	--disable-build-docs \
	CC=${prefix_dir}/bin/gcc \
	CXX=${prefix_dir}/bin/g++
make -j6
make install
cd /
rm -fr ${build_dir}

rm -fr ${cache_dir}
