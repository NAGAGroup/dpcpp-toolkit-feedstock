#!/bin/bash
set -exuo pipefail

cp "${LLVM_SYCL_SOURCE_DIR}/LICENSE.TXT" "${SRC_DIR}/LICENSE.TXT"

if [ ! -d "${INSTALL_PREFIX}" ]; then
  bash "${SUBPROJECT_ROOT}/scripts/configure.sh"
  bash "${SUBPROJECT_ROOT}/scripts/install.sh"
fi
