#!/bin/bash
set -o errexit -o pipefail

if [[ -z $javaVersion ]]; then
  printf 'ARG javaVersion not set, skipping Java installation.\n'
  exit 0
fi

packages=()
packages+=(openjdk-"$javaVersion"-jdk-headless)
packages+=(maven)

# list all apt packages that begin with “openjdk”

aptGet update
apt-cache search openjdk

installPackagesMinified "${packages[@]}"

java -version
mvn -version
