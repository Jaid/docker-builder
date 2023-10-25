#!/bin/bash
set -o errexit -o pipefail

if [[ $# -lt 2 ]]; then
  printf >&2 'Arguments needed: %s\nArguments given:  %s\n' 2 $#
  exit 1
fi

keyName=$1
keyUrl=$2

gpgFolder=$HOME/.cache/gpg
keyFile=$gpgFolder/$keyName.key
keyringName=${keyName}Temp.gpg
gpgTempFile=$gpgFolder/$keyName.gpg
keyringFolder=${keyringFolder:-/etc/apt/keyrings}
gpgFinalFile=$keyringFolder/$keyName.gpg
if [[ -f $gpgFinalFile ]]; then
  printf 'gpg file %s already exists, skipping\n' "$gpgFinalFile"
  exit 0
fi
tempFolderExists=true
if [[ ! -d $gpgFolder ]]; then
  mkdir --parents "$gpgFolder"
  tempFolderExists=false
fi
safeCurl "$keyUrl" --output "$keyFile"
gpg --no-default-keyring --keyring "$keyringName" --import "$keyFile"
gpg --no-default-keyring --keyring "$keyringName" --export --output "$gpgTempFile"
mv "$gpgTempFile" "$gpgFinalFile"
chmod 644 "$gpgFinalFile"
if ! $tempFolderExists; then
  rm --recursive --force "$gpgFolder"
fi
