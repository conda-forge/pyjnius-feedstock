SET "CONDA_PATH_BACKUP=%PATH%"
SET "PATH=%JAVA_HOME%\jre\bin\server;%JAVA_HOME%\bin\server;%JAVA_HOME%\bin;%PATH%"

IF "%CLASSPATH%"=="" (
    SET "CLASSPATH=%CONDA_PREFIX%\share\pyjnius\pyjnius.jar"
) ELSE (
    SET "CONDA_CLASSPATH_BACKUP=%CLASSPATH%"
    SET "CLASSPATH=%CLASSPATH%;%CONDA_PREFIX%\share\pyjnius\pyjnius.jar"
)
