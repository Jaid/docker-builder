#!/bin/bash
set -o errexit -o pipefail

hasIndex=false
if [[ -f /var/lib/apt/lists/lock ]]; then
  hasIndex=true
fi

if $hasIndex; then
  printf 'apt index is locally available, skipping update.\n'
else
  aptGet update
  aptGet upgrade
fi

aptGet install "$@"
