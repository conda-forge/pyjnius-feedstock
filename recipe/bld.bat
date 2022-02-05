@echo on

:: call activation to set up JAVA_HOME correctly; the activation
:: scripts will be copied for the pyjnius-output in build-pkg.bat
call %RECIPE_DIR%\activate.bat

call ant all
if %ERRORLEVEL% neq 0 exit 1

"%PYTHON%" setup.py build_ext --inplace -f
if %ERRORLEVEL% neq 0 exit 1
