if [ -z $CLASSPATH ]; then
    export CLASSPATH="${PREFIX}/share/pyjnius/pyjnius.jar"
else
    export CONDA_CLASSPATH_BACKUP="${CLASSPATH}"
    export CLASSPATH="${CLASSPATH};${PREFIX}/share/pyjnius/pyjnius.jar"
fi
