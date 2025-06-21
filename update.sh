#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

determinePackages() {
  # determine packages to update
  PACKAGES=$(nix flake show --json | jq -r '[.packages[] | keys[]] | sort | unique |  join(",")')
}

updatePackages() {
  # update packages
  for PACKAGE in ${PACKAGES//,/ }; do
    echo "Updating package '$PACKAGE'."
    nix-update --flake --commit "$PACKAGE" 1>/dev/null
  done
}

determinePackages
updatePackages