#!/bin/bash
set -o errexit -o pipefail

if [[ -z $pythonPackageVersion ]]; then
  printf 'ARG pythonPackageVersion not set, skipping Python installation.\n'
  exit 0
fi

packages=()
pythonMajorVersion="${pythonPackageVersion%%.*}"
packages+=("python$pythonPackageVersion")
packages+=("python$pythonPackageVersion-dev")

installPackagesMinified "${packages[@]}"

pythonPath=$(command -v python || command -v python"$pythonMajorVersion")
# $pythonPath --version
