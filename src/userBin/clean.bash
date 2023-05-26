#!/bin/bash
set -o errexit -o pipefail

entries=()
entries+=(/var/log/*)
entries+=(/var/lib/apt/lists/*)
entries+=(/var/cache/apt/archives/*)
entries+=(/var/cache/debconf/templates.dat)
entries+=(/usr/share/doc)
entries+=(/usr/share/man/*/man*)
entries+=(/usr/share/man/**/*.gz)
entries+=(/tmp/*)
entries+=(/var/tmp/*)
rm --recursive --force --verbose "${entries[@]}"
