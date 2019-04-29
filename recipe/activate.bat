@echo off
SET "PYJNIUS_JAR_BACKUP=%PYJNIUS_JAR%"
SET "PYJNIUS_JAR=%CONDA_PREFIX%\share\pyjnius\pyjnius.jar"
SET "PATH_BACKUP=%PATH%"
SET "PATH=%JAVA_HOME%\jre\bin\server;%JAVA_HOME%\bin\server;%JAVA_HOME%\bin;%PATH%"
