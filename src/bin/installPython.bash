#!/bin/bash
set -o errexit -o pipefail

if [[ -z $pythonPackageVersion ]]; then
  printf 'ARG pythonPackageVersion not set, skipping python installation.\n'
  exit 0
fi

packages=()
pythonMajorVersion="${pythonPackageVersion%%.*}"
packages+=("python$pythonPackageVersion")
packages+=("python$pythonPackageVersion-dev")
packages+=("python$pythonPackageVersion-venv")
packages+=("python$pythonPackageVersion-distutils")
packages+=("python$pythonMajorVersion-distutils-extra")

installPackages "${packages[@]}"
