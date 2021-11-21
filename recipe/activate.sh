if [ -z $CLASSPATH ]; then
    export CLASSPATH="${CONDA_PREFIX}/share/pyjnius/*"
else
    export CONDA_CLASSPATH_BACKUP="${CLASSPATH}"
    export CLASSPATH="${CLASSPATH};${CONDA_PREFIX}/share/pyjnius/*"
fi
