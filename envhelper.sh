# EnvHelper # by Martin Mittring # MIT license
# Side effect free, log state in unix environment, tested with Windows Subsystem Linux (WSL)
# Version 0.1 10/1/1025

# To make this script executable:
# > chmod +x mmdebug.sh

# example printout:
#
# $LD_LIBRARY_PATH = /usr/local/cuda/lib64:/usr/local/cuda/lib64:/usr/local/cuda/lib64
# $CUDA_HOME = /usr/local/cuda
# $VIRTUAL_ENV = /home/userName/path/MyEnvironmentName
# Description:    Ubuntu 24.04.2 LTS
# gcc (Ubuntu 11.5.0-1ubuntu1~24.04) 11.5.0
# g++ (Ubuntu 11.5.0-1ubuntu1~24.04) 11.5.0
# Torch version = 2.7.1+cu118
# torch.cuda.is_available() = True
# /home/userName/path/MyEnvironmentName/bin/python
# Python 3.12.3
# GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e45c3f-5a35-1b3a-3727-bc07e4f2f950)
# NVIDIA-SMI version  : 580.82.07
# NVML version        : 580.95
# DRIVER version      : 581.42
# CUDA Version        : 13.0
# nvcc: NVIDIA (R) Cuda compiler driver
# Copyright (c) 2005-2022 NVIDIA Corporation
# Built on Wed_Sep_21_10:33:58_PDT_2022
# Cuda compilation tools, release 11.8, V11.8.89
# Build cuda_11.8.r11.8/compiler.31833905_0

clear
echo "$"LD_LIBRARY_PATH = $LD_LIBRARY_PATH
# /usr/local/cuda/lib64:/usr/local/cuda/lib64:/usr/local/cuda/lib64

echo "$"CUDA_HOME = $CUDA_HOME
# /usr/local/cuda-11.8
# to point to a specific CUDA version
# > export CUDA_HOME=/usr/local/cuda-11.8

echo "$"VIRTUAL_ENV = $VIRTUAL_ENV
# /home/userName/path/MyEnvironmentName

# to create env
# > python3 -m venv MyEnvironmentName
# to activate env
# > source MyEnvironmentName/bin/activate

# get Ubuntu version (supress "No LSB modules are available.")
lsb_release -d 2>/dev/null
# Description:    Ubuntu 24.04.2 LTS

gcc --version | head -n 1
# gcc (Ubuntu 11.5.0-1ubuntu1~24.04) 11.5.0
g++ --version | head -n 1
# g++ (Ubuntu 11.5.0-1ubuntu1~24.04) 11.5.0

# > sudo apt-get --purge remove gcc
# > sudo apt install gcc-11 g++-11
# > sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110
# > sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 110

# those two lines alone set version above
# > sudo update-alternatives --config gcc
# > sudo update-alternatives --config g++

python -c "import torch; print('Torch version =',torch.__version__)"
# Torch version = 2.7.1+cu118

# Install 11.8 CUDA version of torch
# > pip uninstall torch torchvision torchaudio
# > pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118


python -c "import torch; print('torch.cuda.is_available() =', torch.cuda.is_available())"

which python
# /home/userName/path/MyEnvironmentName/bin/python

python --version
# Python 3.12.3

# NVIDIA GPU driver
nvidia-smi -L
# GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e45c3f-5a35-1b3a-3727-bc07e4f2f950)

# installed NVIDIA GPUs
nvidia-smi --version
# NVIDIA-SMI version  : 580.95.02
# NVML version        : 580.95
# DRIVER version      : 581.42
# CUDA Version        : 13.0

# Shows the installed CUDA toolkit version (compiler for CUDA programs).
# might need export PATH=/usr/local/cuda/bin:$PATH
nvcc --version
# nvcc: NVIDIA (R) Cuda compiler driver
# Copyright (c) 2005-2022 NVIDIA Corporation
# Built on Wed_Sep_21_10:33:58_PDT_2022
# Cuda compilation tools, release 11.8, V11.8.89
# Build cuda_11.8.r11.8/compiler.31833905_0

# list all installed cuda versions
# > ls -d /usr/local/cuda* | xargs -n1 basename
#   cuda
#   cuda-11
#   cuda-11.8
#   cuda-13
#   cuda-13.0
# pick a specific version
# > export PATH=/usr/local/cuda-11.8/bin:$PATH

# uninstall CUDA (both), confirm with "Y"
# > sudo apt-get --purge remove "cuda*"
# > sudo apt-get autoremove

# get CUDA 11.8 for Ubuntu 20.04, confirm with "Y" (from https://developer.nvidia.com/cuda-11-8-0-download-archive)
# > wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
# > sudo dpkg -i cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
# > sudo cp /var/cuda-repo-ubuntu2004-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
# > sudo apt install cuda
# 			=> updates gcc which is BAD and CUDA to 13

# > sudo apt install cuda-toolkit-11-8 -y

# what CUDA versions are available after repository setup:
# > apt-cache search cuda-toolkit

# change torch version with specific cuda version
# > pip uninstall torch
# > pip install torch==2.7.1+cu118 --index-url https://download.pytorch.org/whl/cu118

# > pip install build
# > python -m build --wheel --no-isolation



echo
