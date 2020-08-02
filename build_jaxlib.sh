#!/bin/bash
export GCC_HOST_COMPILER_PATH=/usr/bin/gcc-9

# generate compile_commands.json
TF_CUDA_PATHS=/usr,/home/extend/cuda /home/billxue/Code/tool/bazel-compilation-database/generate.sh

TF_CUDA_PATHS=/usr,/home/extend/cuda python build/build.py \
  --enable_march_native \
  --enable_mkl_dnn \
  --enable_cuda

pip install -e build  # installs jaxlib (includes XLA)
pip install -e .  # installs jax
