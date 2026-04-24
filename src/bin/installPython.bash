#!/bin/bash
set -o errexit -o pipefail

if [[ -z $pythonVersion ]]; then
  printf 'ARG pythonVersion not set, skipping Python installation.\n'
  exit 0
fi

export UV_UNMANAGED_INSTALL=/usr/local/bin

safeCurl https://astral.sh/uv/install.sh | sh
uv python install "$pythonVersion"
pythonExecutable=/usr/local/bin/python$(printf '%s' "$pythonVersion" | sed -E 's|^([0-9]+\.[0-9]+).*$|\1|')
if [[ ! -x $pythonExecutable ]]; then
  printf >&2 'Expected Python executable %s to exist.\n' "$pythonExecutable"
  exit 1
fi
ln --force --symbolic "$pythonExecutable" /usr/local/bin/python3
ln --force --symbolic "$pythonExecutable" /usr/local/bin/python
python --version
python3 --version
"$pythonExecutable" --version
uv python list
rm /bin/installPython