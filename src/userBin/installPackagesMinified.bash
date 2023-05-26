#!/bin/bash
set -o errexit -o pipefail

installPackages "$@"
aptGet autoclean
aptGet autoremove
clean
