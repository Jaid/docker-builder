#!/bin/bash
set -o errexit -o pipefail

safeCurl https://sh.rustup.rs | sh -s -- -y --no-modify-path --profile minimal
rm --recursive --force "$RUSTUP_HOME"/toolchains/*/share
rustc --version
cargo --version
rm /bin/setupRust