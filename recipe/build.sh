PYJNIUS_SHARE=$PREFIX/share/pyjnius
mkdir -p $PYJNIUS_SHARE

for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done

make
NOSE_PROCESSES=1 make tests || {
    err=$?
    find "${SRC_DIR}/tests" -name 'hs_err_pid*.log' -print -exec cat {} \;
    exit "${err}"
}
pip install --no-deps .

cp build/pyjnius.jar $PYJNIUS_SHARE
