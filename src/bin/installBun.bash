#!/bin/bash
set -o errexit -o pipefail

if [[ -z $bunVersion ]]; then
  printf 'ARG bunVersion not set, skipping Bun installation.\n'
  exit 0
fi

if ! command -v unzip >/dev/null; then
  installPackagesMinified unzip
fi

export BUN_INSTALL=/usr/local

safeCurl https://bun.sh/install | bash -s "bun-v$bunVersion"

if [[ ! -f /usr/local/bin/bun ]]; then
  ln -s "$BUN_INSTALL/bin/bun" /usr/local/bin/bun
fi

bun --version
