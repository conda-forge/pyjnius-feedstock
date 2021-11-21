@echo on

setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
FOR %%F IN (activate deactivate) DO (
    IF NOT EXIST %PREFIX%\etc\conda\%%F.d MKDIR %PREFIX%\etc\conda\%%F.d
    COPY %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
    COPY %RECIPE_DIR%\%%F.sh %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.sh
)

call %RECIPE_DIR%\activate.bat

SET PYJNIUS_SHARE=%PREFIX%\share\pyjnius
mkdir "%PYJNIUS_SHARE%"

call ant all
if errorlevel 1 exit 1
"%PYTHON%" setup.py build_ext --inplace -f
if errorlevel 1 exit 1

:: install and copy
cd ..
pip install --no-deps .
if errorlevel 1 exit 1
copy build\pyjnius.jar "%PYJNIUS_SHARE%"
if errorlevel 1 exit 1
mkdir %SP_DIR%\jnius\src\org\test-classes
copy build\test-classes %SP_DIR%\jnius\src\org\test-classes
if errorlevel 1 exit 1
