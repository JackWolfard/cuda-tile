#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2025 Jack Wolfard
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_ROOT="$(realpath -s "$SCRIPT_DIR/../")"
BRANCH_NAME="$(git rev-parse --abbrev-ref HEAD)"
BRANCH_STEM="${BRANCH_NAME//\//-}"
BUILD_DIR="$REPO_ROOT/build/$BRANCH_STEM"
INSTALL_DIR="$REPO_ROOT/install/$BRANCH_STEM"

cmake --build "$BUILD_DIR" --target check-cuda-tile
