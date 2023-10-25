#!/bin/bash
set -o errexit -o pipefail

if [[ -z $pythonVersion ]]; then
  printf 'ARG pythonVersion not set, skipping Python installation.\n'
  exit 0
fi

packages=()
pythonMajorVersion="${pythonVersion%%.*}"
packages+=("python$pythonVersion")
packages+=("python$pythonVersion-dev")

installPackagesMinified "${packages[@]}"

# pythonPath=$(command -v python || command -v python"$pythonMajorVersion")
# $pythonPath --version

command -v python || true
command -v python"$pythonMajorVersion" || true
