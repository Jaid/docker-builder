#!/bin/bash
set -o errexit -o pipefail

if [[ -z $nodeVersion ]]; then
  printf 'ARG nodeVersion not set, skipping NodeJS installation.\n'
  exit 0
fi

safeCurl https://deb.nodesource.com/setup_"$nodeVersion".x | bash -
installPackagesMinified nodejs

npm install --global npm
npm install --global node-gyp
npm install --global package-field-cli
