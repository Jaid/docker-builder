#!/bin/bash
set -o errexit -o pipefail

PATH=$CARGO_HOME/bin:$PATH
export PATH
RUSTFLAGS='-C target-cpu=native -C opt-level=3 -C debuginfo=0 -C codegen-units=1'
export RUSTFLAGS
rustTarget=$(rustc -vV | sed -n 's|host: ||p')
CARGO_NET_GIT_FETCH_WITH_CLI=true cargo install --target "$rustTarget" --force "$@" --root /