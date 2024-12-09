if [ -n "${CONDA_CUDA_ROOT}" ]; then
  export CONDA_BACKUP_CUDA_ROOT="$CONDA_CUDA_ROOT"
fi
if [ -n "${CUDA_LIB_PATH}" ]; then
  export CONDA_BACKUP_CUDA_LIB_PATH="$CUDA_LIB_PATH"
fi
export CONDA_CUDA_ROOT="$PREFIX/targets/x86_64-linux"
export CUDA_LIB_PATH="$CONDA_CUDA_ROOT/lib/stubs"

if [ "${CONDA_BUILD:-0}" = "1" ]; then
  export CC="${BUILD_PREFIX}/bin/clang"
  export CXX="${BUILD_PREFIX}/bin/clang++"
  echo "--cuda-path=${CUDA_CONDA_ROOT} --sysroot=${CONDA_BUILD_SYSROOT}" >${PREFIX}/bin/${CONDA_TOOLCHAIN_HOST}-clang.cfg
  echo "--cuda-path=${CUDA_CONDA_ROOT} --sysroot=${CONDA_BUILD_SYSROOT}" >${PREFIX}/bin/${CONDA_TOOLCHAIN_HOST}-clang++.cfg
else
  export CC="${CONDA_PREFIX}/bin/clang"
  export CXX="${CONDA_PREFIX}/bin/clang++"
  echo "--cuda-path=${CUDA_CONDA_ROOT} --sysroot=${CONDA_BUILD_SYSROOT}" >${CONDA_PREFIX}/bin/${CONDA_TOOLCHAIN_HOST}-clang.cfg
  echo "--cuda-path=${CUDA_CONDA_ROOT} --sysroot=${CONDA_BUILD_SYSROOT}" >${CONDA_PREFIX}/bin/${CONDA_TOOLCHAIN_HOST}-clang++.cfg
fi
