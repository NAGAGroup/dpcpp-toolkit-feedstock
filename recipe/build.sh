#!/bin/bash
set -exuo pipefail

cd "${SRC_DIR}"

export INSTALL_PREFIX="${PREFIX}"
export PROJECT_ROOT="${SRC_DIR}"
export SUBPROJECT_ROOT="${SRC_DIR}/llvm"
export INSTALL_RPATHS='$ORIGIN;$ORIGIN/../lib;$ORIGIN/../lib64'
export NO_PATCHELF=1
export SUBPROJECT_ROOT="${SRC_DIR}/llvm"
export LLVM_SYCL_SOURCE_DIR="${SUBPROJECT_ROOT}/llvm"
export LLVM_SYCL_BUILD_DIR="${LLVM_SYCL_SOURCE_DIR}/build"

export LINUX_BUILD_ENV_ACTIVE=0
export DPCPP_BUILD_ENV_ACTIVE=0
source "${SRC_DIR}/activation/linux.sh"
source "${SRC_DIR}/activation/llvm.sh"

cp "${LLVM_SYCL_SOURCE_DIR}/LICENSE.TXT" "${SRC_DIR}/LICENSE.TXT"

bash "${SUBPROJECT_ROOT}/scripts/configure.sh"
bash "${SUBPROJECT_ROOT}/scripts/install.sh"

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
CHANGE="~activate-dpcpp-clang"
mkdir -p "${PREFIX}/etc/conda/activate.d"
cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/activate.d/${CHANGE}.sh"
mkdir -p "${PREFIX}/etc/conda/deactivate.d"
CHANGE="~deactivate-dpcpp-clang"
touch "${PREFIX}/etc/conda/deactivate.d/${CHANGE}.sh"
