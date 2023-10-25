#!/usr/bin/env bash
set -o errexit -o pipefail

if [[ $# -lt 2 ]]; then
  printf >&2 'Arguments needed: %s\nArguments given:  %s\n' 2 $#
  exit 1
fi

keyName=$1
packageUrl=$2
keyUrl=$3

if [[ -z $releaseName ]]; then
  # shellcheck disable=SC1091
  source /etc/os-release
  releaseName=$VERSION_CODENAME
  if [[ -z $releaseName ]]; then
    printf >&2 'ERROR: releaseName not set.\n'
    exit 1
  fi
fi
releaseCategory=${releaseCategory:-main}
gpgFolder=$HOME/.cache/gpg
keyFile=$gpgFolder/$keyName.key
keyringName=${keyName}Temp.gpg
gpgTempFile=$gpgFolder/$keyName.gpg
gpgFinalFile=/etc/apt/keyrings/$keyName.gpg
listFile=/etc/apt/sources.list.d/$keyName.list
if [[ -f $gpgFinalFile ]]; then
  printf 'gpg file %s already exists, skipping\n' "$gpgFinalFile"
  exit 0
fi
if [[ -f $listFile ]]; then
  printf 'List file %s already exists, skipping\n' "$listFile"
  exit 0
fi
mkdir --parents "$gpgFolder"
safeCurl "$keyUrl" --output "$keyFile"
gpg --no-default-keyring --keyring "$keyringName" --import "$keyFile"
gpg --no-default-keyring --keyring "$keyringName" --export --output "$gpgTempFile"
cp "$gpgTempFile" "$gpgFinalFile"
printf 'deb [signed-by=/usr/share/keyrings/%s.gpg] %s %s %s' "$keyName" "$packageUrl" "$releaseName" "$releaseCategory" | tee "$listFile"
aptGet update
