#!/usr/bin/env bash

set -euxo pipefail

rm -rf build || true
mkdir build
cd build

# shellcheck disable=SC2086
cmake "${SRC_DIR}" ${CMAKE_ARGS} \
    -DBUILD_SHARED_LIBS=ON

cmake --build . --config Release -- -j"${CPU_COUNT}"
cmake --build . --config Release --target install
