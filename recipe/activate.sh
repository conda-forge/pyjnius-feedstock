echo "HELLO FROM ACTIVATE.SH"
if [[ -n "${CLASSPATH}" ]]
then
    # only set backup if CLASSPATH is non-empty
    echo "non-empty CLASSPATH"
    export CONDA_CLASSPATH_BACKUP="${CLASSPATH}"
    export CLASSPATH="${CLASSPATH}:${CONDA_PREFIX}/share/pyjnius/pyjnius.jar"
else
    echo "empty CLASSPATH"
    export CLASSPATH="${CONDA_PREFIX}/share/pyjnius/pyjnius.jar"
fi
