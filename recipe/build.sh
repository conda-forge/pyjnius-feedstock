#!/bin/bash

set -ex

PYJNIUS_SHARE=$PREFIX/share/pyjnius
mkdir -p $PYJNIUS_SHARE

for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done

make build_ext

pip install --no-deps .

cp build/pyjnius.jar $PYJNIUS_SHARE
mkdir -p $SP_DIR/jnius/src/org/jnius/test-classes
cp build/test-classes $SP_DIR/jnius/src/org/jnius/test-classes
