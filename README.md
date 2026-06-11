# EnvHelper V 0.12

by Martin Mittring
MIT license

Install and run on unix (linux / ubuntu / wsl):
* store in home folder "~/envHelper"
* "chmod +x ~/envHelper/envhelper.sh"
* run: "~/envHelper/envhelper.sh"

Install and run on windows (Windows 11, powershell):
* todo

Properties:
* Side effect free
* log state in unix environment
* for Unix (tested with Windows Subsystem WSL Ubuntu) and Windows Powershell
* In the script you can find comments on how to adjust the state that was printed e.g. adjust CUDA version 

## Todo

* Test / fix Windows cmd.exe
* Add better error handling to windows version like in unix version (e.g. Python missing).
* Improve on unifying Powershell / Cmd handling e.g.
  * macOS / Linux: echo $VIRTUAL_ENV
  * Windows (Cmd): echo %VIRTUAL_ENV%
  * Windows (PowerShell): echo $env:VIRTUAL_ENV

## Versions

* V0.1: initial version
* V0.12: better error handling in unix version

## example printout (Windows WSL envhelper.sh):

```shell
$LD_LIBRARY_PATH = /usr/local/cuda/lib64:/usr/local/cuda/lib64:/usr/local/cuda/lib64
$CUDA_HOME = /usr/local/cuda
$VIRTUAL_ENV = /home/userName/path/MyEnvironmentName
Description:    Ubuntu 24.04.2 LTS
gcc (Ubuntu 11.5.0-1ubuntu1~24.04) 11.5.0
g++ (Ubuntu 11.5.0-1ubuntu1~24.04) 11.5.0
Torch version = 2.7.1+cu118
torch.cuda.is_available() = True
/home/userName/path/MyEnvironmentName/bin/python
Python 3.12.3
GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e412...)
NVIDIA-SMI version  : 580.82.07
NVML version        : 580.95
DRIVER version      : 581.42
CUDA Version        : 13.0
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2022 NVIDIA Corporation
Built on Wed_Sep_21_10:33:58_PDT_2022
Cuda compilation tools, release 11.8, V11.8.89
Build cuda_11.8.r11.8/compiler.31833905_0
```

## example printout (Windows Powershell envhelper.bat):

```shell
$LD_LIBRARY_PATH = /usr/local/cuda/lib64:
$CUDA_HOME = /usr/local/cuda-12.4
Description:    Ubuntu 24.04.2 LTS
gcc (Ubuntu 11.5.0-1ubuntu1~24.04.1) 11.5.0
g++ (Ubuntu 11.5.0-1ubuntu1~24.04.1) 11.5.0
Python path: /home/username/venvs/torch_env/bin/python3
Python 3.12.3
Python venv = /home/username/venvs/torch_env
Python Torch version = 2.6.0+cu124
torch.cuda.is_available() = True
Conda version: conda 26.3.2
GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e25c3f...)
NVIDIA-SMI version  : 580.82.07
NVML version        : 580.112
DRIVER version      : 581.95
CUDA Version        : 13.0
All installed CUDA versions: cuda cuda-11 cuda-11.8 cuda-12 cuda-12.4 cuda-13 cuda-13.0
CUDA version (from nvcc): 12.4
```
