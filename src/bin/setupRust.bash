#!/bin/bash
set -o errexit -o pipefail

safeCurl https://sh.rustup.rs | sh -s -- -y --no-modify-path
rm --recursive --force ~/.rustup/toolchains/*/share
rm /bin/setupRust
