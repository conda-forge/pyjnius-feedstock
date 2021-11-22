#!/bin/bash

set -ex

# debug
find . -maxdepth 2 -ls

pip install --no-deps .
