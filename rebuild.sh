#!/usr/bin/env bash
set -ex
export VERBOSE=1
ninja --version

THIS_DIR=$(realpath $(dirname $0))
BUILD_DIR=$THIS_DIR/build

rm -rf $BUILD_DIR

BUILD_TYPE=Release
cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=$BUILD_TYPE -H$THIS_DIR -B$BUILD_DIR -DCMAKE_CXX_COMPILER:FILEPATH=g++-10 

cmake --build $BUILD_DIR --config $BUILD_TYPE --target all -- -j 10

# the following option does notwork with target test:  --build $THIS_DIR/build
cd $BUILD_DIR
ctest --build $BUILD_DIR/bin --config $BUILD_TYPE --target test --output-on-failure -- -j 10
cd ..
