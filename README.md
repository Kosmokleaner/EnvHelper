# EnvHelper V 0.1

by Martin Mittring
MIT license

* Side effect free
* log state in unix environment
* for Unix (tested with Windows Subsystem WSL Ubuntu) and Windows Powershell
* In the script you can find comments on how to adjust the state that was printed e.g. adjust CUDA version 

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
GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e45c3f-5a35-1b3a-3727-bc07e4f2f950)
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
Python 3.11.4
Torch version = 2.4.0+cu118
torch.cuda.is_available() = True
Numpy version = 1.26.4
GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e45c3f-5af5-3b3a-3767-bc07e4f2f950)
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2022 NVIDIA Corporation
Built on Wed_Sep_21_10:41:10_Pacific_Daylight_Time_2022
Cuda compilation tools, release 11.8, V11.8.89
Build cuda_11.8.r11.8/compiler.31833905_0
```
