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

installPackages "${packages[@]}"
