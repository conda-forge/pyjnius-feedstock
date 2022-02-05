if not "%CLASSPATH%"=="" (
    REM only set backup if CLASSPATH is non-empty
    set "CONDA_CLASSPATH_BACKUP=%CLASSPATH%"
    set "CLASSPATH=%CLASSPATH%;%PREFIX%\share\pyjnius\pyjnius.jar"
) else (
    set "CLASSPATH=%PREFIX%\share\pyjnius\pyjnius.jar"
)
