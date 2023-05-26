#!/bin/bash
set -o errexit -o pipefail

if [[ -z $nodeVersion ]]; then
  printf 'ARG nodeVersion not set, skipping NodeJS installation.\n'
  exit 0
fi

safeCurl https://deb.nodesource.com/setup_"$nodeVersion".x | bash -
installPackagesMinified nodejs

nodeGyp=false
if [[ -n $pythonPackageVersion ]]; then
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
