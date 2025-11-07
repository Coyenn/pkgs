#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# Detect the system from available packages (use first available system)
SYSTEM=$(nix flake show --json | jq -r '.packages | keys[0]' || echo "x86_64-linux")

# Get all packages from the flake
echo "Extracting package information..."
PACKAGES=$(nix flake show --json | jq -r ".packages.\"${SYSTEM}\" | keys[]" | sort)

# Temporary file for table rows
TABLE_FILE=$(mktemp)
trap "rm -f $TABLE_FILE" EXIT

# Header row
echo "| Package Name | Version | Description | Homepage |" >> "$TABLE_FILE"
echo "|--------------|---------|-------------|----------|" >> "$TABLE_FILE"

# Process each package
for PACKAGE in $PACKAGES; do
  echo "Processing package: $PACKAGE"
  
  # Extract package information using nix eval
  # We need to evaluate the package derivation to get its attributes
  PNAME=$(nix eval --json ".#packages.${SYSTEM}.${PACKAGE}.pname" 2>/dev/null | jq -r . || echo "$PACKAGE")
  VERSION=$(nix eval --json ".#packages.${SYSTEM}.${PACKAGE}.version" 2>/dev/null | jq -r . || echo "unknown")
  DESCRIPTION=$(nix eval --json ".#packages.${SYSTEM}.${PACKAGE}.meta.description" 2>/dev/null | jq -r . || echo "No description available")
  HOMEPAGE=$(nix eval --json ".#packages.${SYSTEM}.${PACKAGE}.meta.homepage" 2>/dev/null | jq -r . || echo "")
  
  # Escape pipe characters in description for markdown table
  DESCRIPTION=$(echo "$DESCRIPTION" | sed 's/|/\\|/g')
  
  # Format homepage as markdown link if available
  if [ -n "$HOMEPAGE" ] && [ "$HOMEPAGE" != "null" ]; then
    HOMEPAGE_LINK="[$HOMEPAGE]($HOMEPAGE)"
  else
    HOMEPAGE_LINK="-"
  fi
  
  # Add row to table
  echo "| $PNAME | $VERSION | $DESCRIPTION | $HOMEPAGE_LINK |" >> "$TABLE_FILE"
done

# Generate README content
README_CONTENT="# Nix Packages

This repository contains Nix package definitions for various tools and utilities.

## Available Packages

$(cat "$TABLE_FILE")

## Usage

To use these packages, add this flake to your Nix configuration:

\`\`\`nix
{
  inputs.rbx-pkgs-flake.url = \"github:Coyenn/pkgs\";
}
\`\`\`

Then reference packages like:

\`\`\`nix
{ rbx-pkgs-flake, ... }: {
  environment.systemPackages = [
    rbx-pkgs-flake.packages.\${system}.pesde
    rbx-pkgs-flake.packages.\${system}.rojo
  ];
}
\`\`\`

## Updating Packages

Packages are automatically updated weekly via GitHub Actions. The README is automatically regenerated after each update.
"

# Write README
echo "Writing README.md..."
echo "$README_CONTENT" > README.md

echo "README.md has been updated successfully!"

