#!/bin/bash
set -euxo pipefail
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"/../ || exit 1
rm -rf build
mkdir -p build
cd build || exit 1
CMAKE="/usr/bin/cmake"
$CMAKE -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr .. -DBUILD_TESTING=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
make -j "$(nproc)"
