#! /bin/bash -ex

source scripts/defaults

# copy virtualenv to install directory
cp -rp ${VIRTUAL_ENV} $BUILD_DIR
