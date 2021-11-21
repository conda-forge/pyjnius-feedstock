@echo on

SET PYJNIUS_SHARE=%PREFIX%\share\pyjnius
mkdir "%PYJNIUS_SHARE%"

call ant all
if errorlevel 1 exit 1
"%PYTHON%" setup.py build_ext --inplace -f
if errorlevel 1 exit 1

:: install and copy
pip install --no-deps .
if errorlevel 1 exit 1
copy build\pyjnius.jar "%PYJNIUS_SHARE%"
if errorlevel 1 exit 1
