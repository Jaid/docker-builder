#!/bin/bash
set -o errexit -o pipefail

if [[ -z $nodeVersion ]]; then
  printf 'ARG nodeVersion not set, skipping NodeJS installation.\n'
  exit 0
fi
NODE_MAJOR="${nodeVersion%%.*}"
export NODE_MAJOR

keyringsFolder=/etc/apt/keyrings
if [[ ! -d $keyringsFolder ]]; then
  printf >&2 'ERROR: %s does not exist.\n' "$keyringsFolder"
  exit 1
fi
safeCurl "https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key" | gpg --dearmor >"$keyringsFolder"/nodesource.gpg
aptGet update
installPackagesMinified nodejs

nodeGyp=false
if [[ -n $pythonVersion ]]; then
  nodeGyp=true
fi
npm install --global npm
if $nodeGyp; then
  npm install --global node-gyp
fi
npm install --global package-field-cli
node --version
npm --version
if $nodeGyp; then
  node-gyp --version
fi
