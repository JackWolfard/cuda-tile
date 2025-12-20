#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2025 Jack Wolfard
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_ROOT="$(realpath -s "$SCRIPT_DIR/../")"

BUILD_DIR="$REPO_ROOT/build"
INSTALL_DIR="$REPO_ROOT/install"

uv venv "$REPO_ROOT/.venv/cuda-tile" --seed --python 3.12
source "$REPO_ROOT/.venv/cuda-tile/bin/activate"
uv pip install \
  --requirements "$REPO_ROOT/third_party/llvm-project/mlir/python/requirements.txt"
