#!/bin/bash -e

cache_dir=${1:-/tmp/cache}

mkdir -p ${cache_dir}
cd ${cache_dir}
wget --no-verbose ftp://gcc.gnu.org/pub/gcc/snapshots/LATEST-9/gcc-9-20190407.tar.xz
wget --no-verbose ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-6.1.0.tar.bz2
wget --no-verbose ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-3.1.4.tar.bz2
wget --no-verbose ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-1.0.3.tar.gz
wget --no-verbose ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.18.tar.bz2
wget --no-verbose http://ftp.gnu.org/gnu/gdb/gdb-8.2.tar.xz

