#!/bin/bash
set -o errexit -o pipefail

if [[ -z $pythonVersion ]]; then
  printf 'ARG pythonVersion not set, skipping Python installation.\n'
  exit 0
fi

safeCurl https://astral.sh/uv/install.sh | sh
uv python install "$pythonVersion"
uv python list