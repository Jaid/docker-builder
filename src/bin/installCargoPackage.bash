#!/usr/bin/env bash
set -o errexit -o pipefail

export PATH=$PATH:$HOME/.cargo/bin
rustTarget=$(rustc -vV | sed -n 's|host: ||p')
cargo install --target "$rustTarget" --force "$@"
