#! /bin/bash -ex

source scripts/defaults

if [ ! -d "$VIRTUAL_ENV" ]; then
    virtualenv ${VIRTUAL_ENV}
fi
source "$VIRTUAL_ENV/bin/activate"

# install dev + prod dependencies
${VIRTUAL_ENV}/bin/pip install tools/peep-2.1.1.tar.gz
${VIRTUAL_ENV}/bin/peep install --download-cache=./pip-cache -r requirements.txt

if [ ! -n "${SOCORRO_DEVELOPMENT_ENV+1}" ]; then
    # install socorro in local virtualenv
    ${VIRTUAL_ENV}/bin/python setup.py install
fi

# setup any unset test configs and databases without overwriting existing files
pushd config
for file in *.ini-dist; do
    if [ ! -f `basename $file -dist` ]; then
        cp $file `basename $file -dist`
    fi
done
popd
