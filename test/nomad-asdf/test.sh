#!/bin/bash

set -e

source dev-container-features-test-lib

check "nomad --version" nomad --version

reportResults