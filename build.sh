#!/bin/bash
set -e

BUILD_DIR="my_build"

if [[ ! -d $BUILD_DIR ]]; then
    mkdir $BUILD_DIR
fi

NUM_CPUS=$(grep -c processor /proc/cpuinfo)

pushd $BUILD_DIR
cmake .. -DCMAKE_INSTALL_PREFIX=$(readlink -f ./install)
cmake --build . --target install -- -j$NUM_CPUS
popd
