#!/bin/bash
set -exuo pipefail

source "${RECIPE_DIR}/activate-build.sh"
bash "${RECIPE_DIR}/build.sh"

cp -r "${INSTALL_PREFIX}/lib"/* "${PREFIX}/lib"
