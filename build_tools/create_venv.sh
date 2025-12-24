#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2025 Jack Wolfard
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_ROOT="$(realpath -s "$SCRIPT_DIR/../")"
BRANCH_NAME="$(git rev-parse --abbrev-ref HEAD)"
BRANCH_STEM="${BRANCH_NAME//\//-}"
VENV_DIR="$REPO_ROOT/.venv/$BRANCH_STEM"
BUILD_DIR="$REPO_ROOT/build/$BRANCH_STEM"
INSTALL_DIR="$REPO_ROOT/install/$BRANCH_STEM"

uv venv "$VENV_DIR" --seed --python 3.12
source "$VENV_DIR/bin/activate"
uv pip install \
  --requirements "$REPO_ROOT/third_party/llvm-project/mlir/python/requirements.txt" \
  pytest
