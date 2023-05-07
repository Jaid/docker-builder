#!/bin/bash
set -o errexit -o pipefail

aptGet update
aptGet upgrade
aptGet install curl build-essential flex texinfo gettext automake pkg-config python3.12 python3.12-dev python3.12-venv python3.12-distutils python3.12-distutils-extra
aptGet autoclean
aptGet autoremove
rm --recursive --force /var/log/* /var/lib/apt/lists/* /var/cache/apt/archives/* /usr/share/doc /usr/share/man
