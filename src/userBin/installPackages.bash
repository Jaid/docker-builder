#!/bin/bash
set -o errexit -o pipefail

hasIndex=false
if [[ -f /var/lib/apt/lists/lock ]]; then
  hasIndex=true
fi

if $hasIndex; then
  printf 'apt index is locally available, skipping update.\n'
else
  retry aptGet update # Better retrying, since it sometimes fails with “Hash Sum mismatch”
  aptGet upgrade
fi

aptGet install "$@"
