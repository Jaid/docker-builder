#!/bin/bash
set -o errexit -o pipefail

type=
if [[ -d "$1" ]]; then
  type=folder
elif [[ -f "$1" ]]; then
  # shellcheck disable=SC2209
  type=file
else
  printf 'missing %s\n' "$1"
  exit 0
fi

realSize=$(du --block-size 1 --apparent-size --summarize "$1" | cut --fields 1 | numfmt --grouping)
fileNormalized=$(realpath --canonicalize-existing "$1")
lsOut=$(ls -U -l --directory --time ctime --time-style full-iso --numeric-uid-gid "$fileNormalized")
permissions=$(printf %s "$lsOut" | cut --delimiter ' ' --fields 1)
owner=$(printf %s "$lsOut" | cut --delimiter ' ' --fields 3)
group=$(printf %s "$lsOut" | cut --delimiter ' ' --fields 4)
timestamp=$(printf %s "$lsOut" | cut --delimiter ' ' --fields 6-8)

if [[ $type == file ]]; then
  sha1=$(sha1sum "$1" | cut --delimiter ' ' --fields 1)
  sha1Upper=${sha1^^}
  # shellcheck disable=SC2046,SC2312
  sha1Short=$(printf %s…%s $(printf %s "$sha1Upper" | cut --characters 1-4) $(printf %s "$sha1Upper" | cut --characters 37-40))
  printf 'file %s (size %s | %s %s:%s | sha1 %s | modified %s)\n' "$fileNormalized" "$realSize" "$permissions" "$owner" "$group" "$sha1Short" "$timestamp"
else
  printf 'folder %s (size %s | %s %s:%s | modified %s)\n' "$fileNormalized" "$realSize" "$permissions" "$owner" "$group" "$timestamp"
fi
