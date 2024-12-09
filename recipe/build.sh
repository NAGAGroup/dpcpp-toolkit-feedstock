#!/bin/bash
set -exuo pipefail

source "${RECIPE_DIR}/activate-build.sh"

cd "${SRC_DIR}"

cp "${LLVM_SYCL_SOURCE_DIR}/LICENSE.TXT" "${SRC_DIR}/LICENSE.TXT"

bash "${SUBPROJECT_ROOT}/scripts/configure.sh"
bash "${SUBPROJECT_ROOT}/scripts/install.sh"

cp "${SRC_DIR}/install/libexec"/* "${PREFIX}/libexec"
cp "${SRC_DIR}/install/share"/* "${PREFIX}/share"
