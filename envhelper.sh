# EnvHelper # by Martin Mittring # MIT license
# Side effect free, log state in unix environment, tested with Windows Subsystem Linux (WSL)
# Version 0.1 10/1/1025

echo "https://github.com/Kosmokleaner/EnvHelper V0.12 $(date "+%Y-%m-%d %H:%M:%S")"
echo

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
# Python path: /home/userName/path/MyEnvironmentName/bin/python
# Python 3.12.3
# Python Torch version = 2.7.1+cu118
# torch.cuda.is_available() = True
# GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e45c3f-5a35-1b3a-3727-bc07e4f2f950)
# NVIDIA-SMI version  : 580.82.07
# NVML version        : 580.95
# DRIVER version      : 581.42
# CUDA Version        : 13.0
# All installed CUDA versions: cuda cuda-11 cuda-11.8 cuda-13 cuda-13.0
# nvcc: NVIDIA (R) Cuda compiler driver
# Copyright (c) 2005-2022 NVIDIA Corporation
# Built on Wed_Sep_21_10:33:58_PDT_2022
# Cuda compilation tools, release 11.8, V11.8.89
# Build cuda_11.8.r11.8/compiler.31833905_0

clear
echo "$"LD_LIBRARY_PATH = $LD_LIBRARY_PATH
# e.g. /usr/local/cuda/lib64:/usr/local/cuda/lib64:/usr/local/cuda/lib64

echo "$"CUDA_HOME = $CUDA_HOME
# e.g. CUDA_HOME = /usr/local/cuda-11.8
# to point to a specific CUDA version
# > export $CUDA_HOME=/usr/local/cuda-11.8

# get Ubuntu version (supress "No LSB modules are available.")
lsb_release -d 2>/dev/null
# e.g. Description:    Ubuntu 24.04.2 LTS

gcc --version | head -n 1
# e.g. gcc (Ubuntu 11.5.0-1ubuntu1~24.04) 11.5.0
g++ --version | head -n 1
# e.g. g++ (Ubuntu 11.5.0-1ubuntu1~24.04) 11.5.0

# > sudo apt-get --purge remove gcc
# > sudo apt install gcc-11 g++-11
# > sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110
# > sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 110

# those two lines alone set version above
# > sudo update-alternatives --config gcc
# > sudo update-alternatives --config g++

# in some environments we see python, in others python3
PYTHON_BIN=$(command -v python3 || command -v python)

if VERSION=$("$PYTHON_BIN" --version 2>&1); then
	echo "Python path: $(which "$PYTHON_BIN")"
	# e.g. Python path: /home/userName/path/MyEnvironmentName/bin/python
	"$PYTHON_BIN" --version
	# e.g.  Python 3.12.3
	echo "Python venv = $VIRTUAL_ENV"
	# e.g. $VIRTUAL_ENV = /home/userName/path/MyEnvironmentName
	# to create env
	# > python3 -m venv MyEnvironmentName
	# to set/activate env
	# > source ~/venvs/torch_env/bin/activate
	# or
	# > source MyEnvironmentName/bin/activate
	if "$PYTHON_BIN" -m pip show torch >/dev/null 2>&1; then
		"$PYTHON_BIN" -c "import torch; print('Python Torch version =', torch.__version__)"
		# e.g. Python Torch version = 2.7.1+cu118
		"$PYTHON_BIN" -c "import torch; print('torch.cuda.is_available() =', torch.cuda.is_available())"
		# e.g. torch.cuda.is_available() = True
	else
		echo "Torch: not installed!"
		# Install 11.8 CUDA version of torch (in virtual environment):
		# > python3 -m venv ~/venvs/torch_env
		# > source ~/venvs/torch_env/bin/activate
		# > pip uninstall torch torchvision torchaudio
		# > pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
	fi
else
    echo "Python: non installed!"
fi

if command -v conda >/dev/null 2>&1; then
    echo "Conda version: $(conda --version)"
	# e.g. Conda: conda 26.3.2
else
    echo "Conda: not installed"
	# get https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
	# copy to user folder (~) e.g. cp /mnt/c/Users/<YourWindowsUsername>/Downloads/Miniforge3-Linux-x86_64.sh ~/
	# > /home/mmittring/miniforge3/bin/conda init
	# restart shell
fi
 
# NVIDIA GPU driver
# e.g.
nvidia-smi -L
# GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e45c3f-5a35-1b3a-3727-bc07e4f2f950)

# installed NVIDIA GPUs
nvidia-smi --version
# e.g.
# NVIDIA-SMI version  : 580.95.02
# NVML version        : 580.95
# DRIVER version      : 581.42
# CUDA Version        : 13.0

echo "All installed CUDA versions: $(basename -a /usr/local/cuda* 2>/dev/null | xargs)"
# e.g.
#   All installed CUDA versions: cuda cuda-11 cuda-11.8 cuda-13 cuda-13.0
# install cuda-12.4
# > sudo apt install cuda-toolkit-12-4 -y

# Shows the installed CUDA toolkit version (compiler for CUDA programs).
# might need export PATH=/usr/local/cuda/bin:$PATH
if command -v nvcc >/dev/null 2>&1; then
	# 5 lines is too much: > nvcc --version
	# e.g.
	# nvcc: NVIDIA (R) Cuda compiler driver
	# Copyright (c) 2005-2022 NVIDIA Corporation
	# Built on Wed_Sep_21_10:33:58_PDT_2022
	# Cuda compilation tools, release 11.8, V11.8.89
	# Build cuda_11.8.r11.8/compiler.31833905_0
	CUDA_VERSION=$(nvcc --version | sed -n 's/.*release \([0-9.]*\),.*/\1/p')
	echo "CUDA version (from nvcc): $CUDA_VERSION"
	# use symlink to point to cuda version
	# > export PATH=/usr/local/cuda/bin:$PATH
	# > export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
	# set symlink to cuda-12.4
	# > sudo ln -sfn /usr/local/cuda-12.4 /usr/local/cuda
else
    echo "nvcc: not installed (CUDA toolkit is not installed or not in PATH)"
	# fix by picking a specific version
	# > export PATH=/usr/local/cuda-11.8/bin:$PATH
fi

# uninstall CUDA (both), confirm with "Y"
# > sudo apt-get --purge remove "cuda*"
# > sudo apt-get autoremove

# get CUDA 11.8 for Ubuntu 20.04, confirm with "Y" (from https://developer.nvidia.com/cuda-11-8-0-download-archive)
# > wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
# > sudo dpkg -i cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
# > sudo cp /var/cuda-repo-ubuntu2004-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
# > sudo apt install cuda
# 			=> updates gcc which is BAD and CUDA to 13

# what CUDA versions are available after repository setup:
# > apt-cache search cuda-toolkit

# change torch version with specific cuda version
# > pip uninstall torch
# > pip install torch==2.7.1+cu118 --index-url https://download.pytorch.org/whl/cu118

# > pip install build
# > python -m build --wheel --no-isolation



echo
