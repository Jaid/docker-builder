#!/bin/bash
set -o errexit -o pipefail

packages=()
packages+=(git)
packages+=(curl)
packages+=(build-essential)
packages+=(flex)
packages+=(texinfo)
packages+=(gettext)
packages+=(automake)
packages+=(pkg-config)
if [[ -n $pythonPackageVersion ]]; then
  packages+=("python$pythonPackageVersion")
  packages+=("python$pythonPackageVersion-dev")
  packages+=("python$pythonPackageVersion-venv")
  packages+=("python$pythonPackageVersion-distutils")
  packages+=("python$pythonPackageVersion-distutils-extra")
fi

aptGet update
aptGet upgrade
aptGet install "${packages[@]}"
aptGet autoclean
aptGet autoremove
rm --recursive --force /var/log/* /var/lib/apt/lists/* /var/cache/apt/archives/* /usr/share/doc /usr/share/man
