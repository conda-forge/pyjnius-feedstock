#!/bin/bash

set -ex

PYJNIUS_SHARE=$PREFIX/share/pyjnius
mkdir -p $PYJNIUS_SHARE

for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done

pip install --no-deps .

cp build/pyjnius.jar $PYJNIUS_SHARE
