#!/bin/bash
set -e

BUILD_DIR="my_build"

if [[ ! -d $BUILD_DIR ]]; then
    mkdir $BUILD_DIR
fi

NUM_CPUS=$(grep -c processor /proc/cpuinfo)

BOOST_PARAM=""
if [[ $HOSTNAME == *"rack-mad"* ]]; then
  BOOST_PARAM="-DBOOST_ROOT:PATHNAME=/usr/local/lib/boost_1_59_0/"
fi

pushd $BUILD_DIR
cmake .. $BOOST_PARAM \
  -DCMAKE_INSTALL_PREFIX=$(readlink -f ./install)
cmake --build . --target install -- -j$NUM_CPUS
popd
