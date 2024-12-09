export PROJECT_ROOT="${SRC_DIR}"
export SUBPROJECT_ROOT="${SRC_DIR}/llvm"
export INSTALL_RPATHS='$ORIGIN;$ORIGIN/../lib;$ORIGIN/../lib64'
export NO_PATCHELF=1
export SUBPROJECT_ROOT="${SRC_DIR}/llvm"
export LLVM_SYCL_SOURCE_DIR="${SUBPROJECT_ROOT}/llvm"
export LLVM_SYCL_BUILD_DIR="${RECIPE_DIR}/../build"
export INSTALL_PREFIX="$RECIPE_DIR/../install"

export LINUX_BUILD_ENV_ACTIVE=0
export DPCPP_BUILD_ENV_ACTIVE=0
source "${SRC_DIR}/activation/llvm.sh"
