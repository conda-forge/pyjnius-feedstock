@echo on

SET PYJNIUS_SHARE=%PREFIX%\share\pyjnius
mkdir %PYJNIUS_SHARE%

copy build\pyjnius.jar %PYJNIUS_SHARE%
if %ERRORLEVEL% neq 0 exit 1
