if not "%CLASSPATH%"=="" (
    set "CONDA_CLASSPATH_BACKUP=%CLASSPATH%"
    set "CLASSPATH=%CLASSPATH%;%PREFIX%\share\pyjnius\*"
) else (
    set "CLASSPATH=%PREFIX%\share\pyjnius\*"
)

:: %PATH% is never empty
set "CONDA_PATH_BACKUP=%PATH%"
set "PATH=%JAVA_HOME%\jre\bin\server;%JAVA_HOME%\bin\server;%JAVA_HOME%\bin;%PATH%"
