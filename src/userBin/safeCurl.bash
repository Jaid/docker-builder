#!/usr/bin/env bash
set -o errexit -o pipefail

curl --location --retry 3 --fail --silent --show-error --header 'Cache-Control: no-cache' "$@"
