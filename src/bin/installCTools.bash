#!/bin/bash
set -o errexit -o pipefail

packages=()
packages+=(build-essential)
packages+=(cmake)
packages+=(flex)
packages+=(texinfo)
packages+=(gettext)
packages+=(automake)
packages+=(pkg-config)
packages+=(ninja-build)
packages+=(g++)
packages+=(gcc)

installPackagesMinified "${packages[@]}"
