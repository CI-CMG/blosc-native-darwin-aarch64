#!/usr/bin/env bash

set -ex

git clone git@github.com:Blosc/c-blosc.git
cd c-blosc
git checkout -b temp-branch $BLOSC_TAG
mkdir build
cd build
cmake ..
cmake --build . --config Release
cd ../..
mkdir -p src/main/resources/darwin-aarch64
cp c-blosc/build/blosc/libblosc.dylib src/main/resources/darwin-aarch64
rm -rf c-blosc