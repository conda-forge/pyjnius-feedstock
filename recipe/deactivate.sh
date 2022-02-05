if [[ -n "${CONDA_CLASSPATH_BACKUP}" ]]
then
    # only restore if CONDA_CLASSPATH_BACKUP is non-empty
    export CLASSPATH="${CONDA_CLASSPATH_BACKUP}"
    unset CONDA_CLASSPATH_BACKUP
else
    unset CLASSPATH
fi
