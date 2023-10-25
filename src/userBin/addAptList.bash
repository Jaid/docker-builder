#!/bin/bash
set -o errexit -o pipefail

if [[ $# -lt 2 ]]; then
  printf >&2 'Arguments needed: %s\nArguments given:  %s\n' 2 $#
  exit 2
fi

listName=$1
packageUrl=$2
if [[ -n $3 ]]; then
  keyName=$3
else
  keyName=$listName
fi
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
keyringFolder=${keyringFolder:-/etc/apt/keyrings}
listFolder=${listFolder:-/etc/apt/sources.list.d}
gpgFinalFile=$keyringFolder/$keyName.gpg
listFile=$listFolder/$listName.list
if [[ -f $listFile ]]; then
  printf 'List file %s already exists, skipping\n' "$listFile"
  exit 0
fi
printf 'deb [signed-by=%s] %s %s %s\n' "$gpgFinalFile" "$packageUrl" "$releaseName" "$releaseCategory" | tee "$listFile"
chmod 644 "$listFile"
aptGet update
