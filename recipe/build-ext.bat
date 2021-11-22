@echo on

SET PYJNIUS_SHARE=%PREFIX%\share\pyjnius
mkdir "%PYJNIUS_SHARE%"

copy build\pyjnius.jar "%PYJNIUS_SHARE%"
if errorlevel 1 exit 1
