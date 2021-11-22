#!/bin/bash

set -ex

PYJNIUS_SHARE=$PREFIX/share/pyjnius
mkdir -p $PYJNIUS_SHARE

make build_ext

pip install --no-deps .
cp build/pyjnius.jar $PYJNIUS_SHARE

jar cfv pyjnius-test.jar build/test-classes
cp pyjnius-test.jar $PYJNIUS_SHARE
