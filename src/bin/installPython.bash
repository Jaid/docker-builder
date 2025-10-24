#!/bin/bash
set -o errexit -o pipefail

if [[ -z $pythonVersion ]]; then
  printf 'ARG pythonVersion not set, skipping Python installation.\n'
  exit 0
fi

PATH=$HOME/.local/bin:/root/.local/bin:$PATH
export PATH

safeCurl https://astral.sh/uv/install.sh | sh
uv python install "$pythonVersion"
uv python list