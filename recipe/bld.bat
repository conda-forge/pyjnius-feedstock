@echo on

call ant all
if %ERRORLEVEL% neq 0 exit 1

"%PYTHON%" setup.py build_ext --inplace -f
if %ERRORLEVEL% neq 0 exit 1
