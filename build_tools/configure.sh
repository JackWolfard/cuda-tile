#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2025 Jack Wolfard
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_ROOT="$(realpath -s "$SCRIPT_DIR/../")"

BUILD_DIR="$REPO_ROOT/build"
INSTALL_DIR="$REPO_ROOT/install"

cmake -G Ninja -S "$REPO_ROOT" -B "$BUILD_DIR" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER="$(which clang)" \
  -DCMAKE_CXX_COMPILER="$(which clang++)" \
  -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" \
  -DPython3_EXECUTABLE="$(which python3)" \
  -DLLVM_ENABLE_ASSERTIONS=OFF \
  -DCUDA_TILE_ENABLE_BINDINGS_PYTHON=ON \
  -DCUDA_TILE_ENABLE_CCACHE=ON \
  -DCUDA_TILE_ENABLE_TESTING=ON \
  -DCUDA_TILE_USE_LLVM_SOURCE_DIR="$REPO_ROOT/third_party/llvm-project"
