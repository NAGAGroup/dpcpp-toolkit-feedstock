#!/bin/bash
set -exuo pipefail

source "${RECIPE_DIR}/activate-build.sh"

cd "${SRC_DIR}"

cp "${LLVM_SYCL_SOURCE_DIR}/LICENSE.TXT" "${SRC_DIR}/LICENSE.TXT"

bash "${SUBPROJECT_ROOT}/scripts/configure.sh"
bash "${SUBPROJECT_ROOT}/scripts/install.sh"

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
CHANGE="activate"
for CHANGE in "activate" "deactivate"; do
  mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
  cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/~open-dpcpp-toolkit-${CHANGE}.sh"
done
