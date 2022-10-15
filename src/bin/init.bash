#!/usr/bin/env bash

# shellcheck disable=SC2154
addgroup --system --gid "$groupId" "$groupName"
# shellcheck disable=SC2154
adduser --disabled-password --gecos '' --uid "$userId" --ingroup "$groupName" --home "$userHome" --no-create-home --shell /bin/bash "$userName"
mkdir --parents "$userHome"/bin
chown --recursive "$userId":"$groupId" "$userHome"
DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes update
DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes upgrade
DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install curl
DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install build-essential

rm /bin/init.bash
