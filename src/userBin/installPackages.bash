#!/bin/bash
set -o errexit -o pipefail

aptGet update
aptGet upgrade
aptGet install "$@"
aptGet autoclean
aptGet autoremove
rm --recursive --force /var/log/* /var/lib/apt/lists/* /var/cache/apt/archives/* /usr/share/doc /usr/share/man
