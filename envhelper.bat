@rem EnvHelper # by Martin Mittring # MIT license
@rem to run in Windows from cmd.exe or Powershell (.bat files are run in a cmd.exe environment)
@echo off
cls

echo https://github.com/Kosmokleaner/EnvHelper V0.13 today: %date% %time%
rem empty line echo in .bat, "(" is needed
echo(

if "%PROMPT%"=="$P$G" (
    echo Started from CMD.exe
) else (
    echo Started from PowerShell (via CMD)
)

:: %~dp0 retrieves the Drive (d) and Path (p) of script 0 (the running .bat file)
set SCRIPT_DIR=%~dp0

echo Running python script in: %SCRIPT_DIR%

python --version

if "%VIRTUAL_ENV%"=="" (
    echo $VIRTUAL_ENV =
) else (
    echo $VIRTUAL_ENV = %VIRTUAL_ENV%
)
rem e.g.
rem $VIRTUAL_ENV = D:\dev\PythonExperiments\MyEnvironmentName

rem to create env
rem > python -m venv MyEnvironmentName
rem to create env (MyEnvironmentName is a placeholder for your environment name)
rem > python -m venv MyEnvironmentName
rem to activate env (cmd.exe)
rem > MyEnvironmentName\Scripts\activate.bat
rem to activate env (Powershell)
rem > MyEnvironmentName\Scripts\Activate.ps1

python %SCRIPT_DIR%envhelper.py

rem python -c "import torch; print('Torch version =',torch.__version__)"
rem Torch version = 2.7.1+cu118
rem python -c "import torch; print('torch.cuda.is_available() =', torch.cuda.is_available())"
rem python -c "import numpy; print('Numpy version =',numpy.__version__)"
rem Numpy version = 1.26.0

rem NVIDIA GPU driver
nvidia-smi -L
rem GPU 0: NVIDIA GeForce RTX 3090 (UUID: GPU-23e45c3f-5a35-1b3a-3727-bc07e4f2f950)

rem Shows the installed CUDA toolkit version (compiler for CUDA programs).
rem might need export PATH=/usr/local/cuda/bin:$PATH
nvcc --version
