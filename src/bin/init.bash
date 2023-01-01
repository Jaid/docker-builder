#!/usr/bin/env bash
set -o errexit -o pipefail

# shellcheck disable=SC2154
addgroup --system --gid "$groupId" "$groupName"
# shellcheck disable=SC2154
adduser --disabled-password --gecos '' --uid "$userId" --ingroup "$groupName" --home "$userHome" --no-create-home --shell /bin/bash "$userName"
mkdir --parents "$userHome"/bin
chown --recursive "$userId":"$groupId" "$userHome"
curl --location --retry 3 --fail --silent --show-error --header 'Cache-Control: no-cache' https://sh.rustup.rs | sh -s -- -y --no-modify-path
installCargoPackage sd
declare -a userBinaries=(
  installCargoPackage
)
for userBinary in "${userBinaries[@]}"; do
  mv "/bin/$userBinary.bash" "/bin/$userBinary"
  chmod ugo+x "/bin/$userBinary"
done
rm /bin/init.bash
