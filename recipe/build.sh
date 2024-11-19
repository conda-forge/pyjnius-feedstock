#!/bin/bash

set -ex

PYJNIUS_SHARE=$PREFIX/share/pyjnius
mkdir -p $PYJNIUS_SHARE

for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done

if [[ "${openjdk}" == "21" || "${openjdk}" == "*" ]]; then
    # need to update JAVA_TARGET; 1.7 not supported anymore
    sed -i.bak "s/'1.7'/'8'/g" Makefile
fi

# compile
make

# install
pip install --no-deps .

# copy artefact
cp build/pyjnius.jar $PYJNIUS_SHARE
