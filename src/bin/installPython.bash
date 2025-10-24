#!/bin/bash
set -o errexit -o pipefail

if [[ -z $pythonVersion ]]; then
  printf 'ARG pythonVersion not set, skipping Python installation.\n'
  exit 0
fi

safeCurl https://astral.sh/uv/install.sh | sh
~/.local/bin/uv python install "$pythonVersion"
~/.local/bin/uv python list