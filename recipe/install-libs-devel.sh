#!/bin/bash
set -exuo pipefail

source "${RECIPE_DIR}/activate-build.sh"

cp "${SRC_DIR}/install/include"/* "${PREFIX}/include"
