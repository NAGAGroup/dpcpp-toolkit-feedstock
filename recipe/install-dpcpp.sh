#!/bin/bash
set -exuo pipefail

source "${RECIPE_DIR}/activate-build.sh"

cp "${SRC_DIR}/install/bin"/* "${PREFIX}/bin"
cp "${SRC_DIR}/install/lib"/* "${PREFIX}/lib"
cp "${SRC_DIR}/install/etc"/* "${PREFIX}/etc"
