@echo off
setlocal
chcp 65001 >nul
cd /d "%~dp0"

set "PYTHON_EXE=python"
if exist ".venv\Scripts\python.exe" set "PYTHON_EXE=.venv\Scripts\python.exe"

if exist "%PYTHON_EXE%" goto run_bot
where python >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Python ne naiden. Ustanovi Python ili aktiviruy .venv.
    pause
    exit /b 1
)
:run_bot

"%PYTHON_EXE%" bot_prodazh.py
set "EXIT_CODE=%ERRORLEVEL%"

if not "%EXIT_CODE%"=="0" (
    echo.
    echo [ERROR] Bot prodazh zavershilsya s kodom %EXIT_CODE%.
    pause
)

exit /b %EXIT_CODE%
