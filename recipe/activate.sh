if [ -z $CLASSPATH ]; then
    export CLASSPATH="${CONDA_PREFIX}/share/pyjnius/pyjnius.jar"
else
    export CONDA_CLASSPATH_BACKUP="${CLASSPATH}"
    export CLASSPATH="${CLASSPATH};${CONDA_PREFIX}/share/pyjnius/pyjnius.jar"
fi
