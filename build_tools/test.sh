#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2025 Jack Wolfard
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_ROOT="$(realpath -s "$SCRIPT_DIR/../")"

BUILD_DIR="$REPO_ROOT/build"
INSTALL_DIR="$REPO_ROOT/install"

cmake --build "$BUILD_DIR" --target check-cuda-tile
