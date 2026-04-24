#!/bin/bash
set -o errexit -o pipefail

userId=${userId:-1000}
userName=${userName:-}
groupId=${groupId:-1000}
groupName=${groupName:-$userName}
userHome=${userHome:-}

existingUser=$(id --name --user "$userId" || true)
existingGroup=$(id --name --group "$groupId" || true)
if [[ -n "$existingUser" ]]; then
  usermod --uid 1001 "$existingUser"
fi
if [[ -n "$existingGroup" ]]; then
  groupmod --gid 1001 "$existingGroup"
fi
userAddArguments=(--uid "$userId")
if [[ -n "$userHome" ]]; then
  userAddArguments+=(--home-dir "$userHome")
  if [[ -d "$userHome" ]]; then
    userAddArguments+=(--no-create-home)
  fi
else
  userAddArguments+=(--no-create-home)
fi
bashPath=$(command -v bash || true)
if [[ -n "$bashPath" ]]; then
  userAddArguments+=(--shell "$bashPath")
fi
if [[ -n "$groupName" ]]; then
  groupadd --gid "$groupId" "$groupName"
  userAddArguments+=(--gid "$groupName")
fi
useradd "${userAddArguments[@]}" "$userName"
mkdir --parents "$userHome/bin"
mkdir --parents "$userHome/userBin"

rm /bin/initBuilder