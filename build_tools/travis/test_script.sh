#!/bin/bash
# This script is meant to be called by the "script" step defined in
# .travis.yml. See http://docs.travis-ci.com/ for more details.
# The behavior of the script is controlled by environment variabled defined
# in the .travis.yml in the top level folder of the project.

# License: 3-clause BSD

set -e

python --version

export PYTHONHASHSEED=2157

run_tests() {
    KERAS_BACKEND=tensorflow py.test -v --cov=deep_qa --durations=20
}

if [[ "$RUN_PYLINT" == "true" ]]; then
    source scripts/pylint.sh
fi

if [[ "$SKIP_TESTS" != "true" ]]; then
    run_tests
fi
