#!/bin/bash
set -o errexit -o pipefail

installCargoPackage sd
rm /bin/setupBuilder
