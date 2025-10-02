@rem EnvHelper # by Martin Mittring # MIT license
@rem to run in Windows from Powershell
@echo off
cls

python --version

python -c "import torch; print('Torch version =',torch.__version__)"
rem Torch version = 2.7.1+cu118

python -c "import torch; print('torch.cuda.is_available() =', torch.cuda.is_available())"

python -c "import numpy; print('Numpy version =',numpy.__version__)"
rem Numpy version = 1.26.0

rem NVIDIA GPU driver
nvidia-smi -L
rem GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e45c3f-5a35-1b3a-3727-bc07e4f2f950)

rem Shows the installed CUDA toolkit version (compiler for CUDA programs).
rem might need export PATH=/usr/local/cuda/bin:$PATH
nvcc --version
