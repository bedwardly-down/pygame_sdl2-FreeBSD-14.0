#!/bin/bash

set -xe

SCRIPT="$(dirname $(realpath $0))"
PROJECT="${1:-pygame_sdl2}"
SUFFIX="$2"

if test -n "$SUFFIX"; then
    EGG_INFO="egg_info --tag-build $SUFFIX"
else
    EGG_INFO=
fi

rm -Rf dist || true
mkdir dist

python setup.py build
python3 setup.py build

python setup.py $EGG_INFO sdist

