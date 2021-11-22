#!/bin/bash

set -ex

# debug
find . -maxdepth 2 -type d -ls

pip install --no-deps .
