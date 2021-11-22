#!/bin/bash

set -ex

PYJNIUS_SHARE=$PREFIX/share/pyjnius
mkdir -p $PYJNIUS_SHARE

cp build/pyjnius.jar $PYJNIUS_SHARE
