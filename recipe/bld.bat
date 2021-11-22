@echo on

:: call activation to set up JAVA_HOME correctly; the activation
:: scripts will be copied for the pyjnius-output in build-pkg.bat
call %RECIPE_DIR%\activate.bat

call ant all
if errorlevel 1 exit 1

"%PYTHON%" setup.py build_ext --inplace -f
if errorlevel 1 exit 1
