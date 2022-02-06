@echo on

setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
FOR %%F IN (activate deactivate) DO (
    IF NOT EXIST %PREFIX%\etc\conda\%%F.d MKDIR %PREFIX%\etc\conda\%%F.d
    COPY %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
    if %ERRORLEVEL% neq 0 exit 1
)

:: put relevant parts of JAVA_HOME on the path
set PATH=%JAVA_HOME%\jre\bin\server;%JAVA_HOME%\bin\server;%JAVA_HOME%\bin;%PATH%

set "PYJNIUS_SHARE=%PREFIX%\share\pyjnius"
mkdir %PYJNIUS_SHARE%

:: compile java
call ant all
if %ERRORLEVEL% neq 0 exit 1

:: compile python
"%PYTHON%" setup.py build_ext --inplace -f
if %ERRORLEVEL% neq 0 exit 1

:: install
pip install --no-deps .
if %ERRORLEVEL% neq 0 exit 1

:: copy artefact
copy build\pyjnius.jar %PYJNIUS_SHARE%
if %ERRORLEVEL% neq 0 exit 1
