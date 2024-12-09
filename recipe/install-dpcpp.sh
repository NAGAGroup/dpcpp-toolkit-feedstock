#!/bin/bash
set -exuo pipefail

source "${RECIPE_DIR}/activate-build.sh"
bash "${RECIPE_DIR}/build.sh"

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
CHANGE="activate"
for CHANGE in "activate" "deactivate"; do
  mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
  cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/~open-dpcpp-toolkit-${CHANGE}.sh"
done

cp -r "${INSTALL_PREFIX}/bin"/* "${PREFIX}/bin"
cp -r "${INSTALL_PREFIX}/libexec"/* "${PREFIX}/libexec"
cp -r "${INSTALL_PREFIX}/share"/* "${PREFIX}/share"

echo "--cuda-path='@PREFIX@/targets/x86_64-linux' --sysroot='@BUILD_PREFIX@/${CONDA_TOOLCHAIN_HOST}'" >"${PREFIX}/bin/${CONDA_TOOLCHAIN_HOST}-clang.cfg"
echo "--cuda-path='@PREFIX@/targets/x86_64-linux' --sysroot='@BUILD_PREFIX@/${CONDA_TOOLCHAIN_HOST}'" >"${PREFIX}/bin/${CONDA_TOOLCHAIN_HOST}-clang++.cfg"
