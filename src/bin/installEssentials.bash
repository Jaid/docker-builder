#!/bin/bash
set -o errexit -o pipefail

packages=()
packages+=(git)
packages+=(curl)

installPackagesMinified "${packages[@]}"
