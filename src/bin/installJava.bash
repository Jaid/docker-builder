#!/bin/bash
set -o errexit -o pipefail

if [[ -z $javaVersion ]]; then
  printf 'ARG javaVersion not set, skipping Java installation.\n'
  exit 0
fi

packages=()
packages+=(openjdk-"$javaVersion"-jdk)
packages+=(maven)

installPackages "${packages[@]}"

java -version
mvn -version
