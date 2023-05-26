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
packages+=("python$pythonPackageVersion-venv")
packages+=("python$pythonPackageVersion-distutils")
packages+=("python$pythonMajorVersion-distutils-extra")

installPackagesMinified "${packages[@]}"

pythonPath=$(command -v python || command -v python"$pythonMajorVersion")
$pythonPath --version
