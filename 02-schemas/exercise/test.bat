@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "TMP_OUT=%TEMP%\mySystem-%RANDOM%.json"

pkl eval -f json "%SCRIPT_DIR%mySystem.pkl" > "%TMP_OUT%"
if errorlevel 1 (
    del "%TMP_OUT%" 2>nul
    exit /b 1
)

git diff --no-index "%TMP_OUT%" "%SCRIPT_DIR%mySystem.json"
set "EXIT_CODE=%ERRORLEVEL%"

del "%TMP_OUT%" 2>nul
exit /b %EXIT_CODE%
