@echo on

:: install and copy
pip install --no-deps .
if %ERRORLEVEL% neq 0 exit 1
