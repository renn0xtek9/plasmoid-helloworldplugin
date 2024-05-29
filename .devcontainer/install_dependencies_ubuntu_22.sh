#!/bin/bash
set -euxo pipefail
# shellcheck disable=SC2034
DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install shellcheck clang-format qtbase5-dev plasma-desktop-dev qml-module-qttest qtdeclarative5-dev libkf5plasma-dev build-essential cmake extra-cmake-modules gettext g++ python3-pip gettext gdb -y
python3 -m pip install cmake-format pre-commit
