setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
FOR %%F IN (activate deactivate) DO (
    IF NOT EXIST %PREFIX%\etc\conda\%%F.d MKDIR %PREFIX%\etc\conda\%%F.d
    COPY %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
    if %ERRORLEVEL% neq 0 exit 1
)

call %RECIPE_DIR%\activate.bat

SET PYJNIUS_SHARE=%PREFIX%\share\pyjnius
mkdir "%PYJNIUS_SHARE%"

call ant all
if %ERRORLEVEL% neq 0 exit 1
"%PYTHON%" setup.py build_ext --inplace -f
if %ERRORLEVEL% neq 0 exit 1

:: run tests
cd tests
set CLASSPATH=..\build\test-classes;..\build\classes
pytest -v ..
if %ERRORLEVEL% neq 0 exit 1
cd ..

:: install and copy
pip install --no-deps .
if %ERRORLEVEL% neq 0 exit 1
copy build\pyjnius.jar "%PYJNIUS_SHARE%"
if %ERRORLEVEL% neq 0 exit 1
