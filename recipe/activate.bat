echo "HELLO FROM ACTIVATE.BAT"
if not "%CLASSPATH%"=="" (
    REM only set backup if CLASSPATH is non-empty
    echo "non-empty CLASSPATH"
    set "CONDA_CLASSPATH_BACKUP=%CLASSPATH%"
    set "CLASSPATH=%CLASSPATH%;%PREFIX%\share\pyjnius\pyjnius.jar"
) else (
    echo "empty CLASSPATH"
    set "CLASSPATH=%PREFIX%\share\pyjnius\pyjnius.jar"
)

:: %PATH% is never empty
SET "CONDA_PATH_BACKUP=%PATH%"
SET "PATH=%JAVA_HOME%\jre\bin\server;%JAVA_HOME%\bin\server;%JAVA_HOME%\bin;%PATH%"
