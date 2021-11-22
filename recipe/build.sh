#!/bin/bash

set -ex

PYJNIUS_SHARE=$PREFIX/share/pyjnius
mkdir -p $PYJNIUS_SHARE

make build_ext

pip install --no-deps .

cp build/pyjnius.jar $PYJNIUS_SHARE
