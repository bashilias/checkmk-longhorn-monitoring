#!/usr/bin/env bash
# Copyright (c) Ilias Yacoubi (contact@ilias.sh)
# Installation script for Longhorn CheckMK monitoring

set -e

INSTALL_DIR="/usr/lib/check_mk_agent/local"
SCRIPTS_DIR="$(dirname "$0")/scripts"

echo "Installing Longhorn monitoring checks to $INSTALL_DIR"

if [ ! -d "$INSTALL_DIR" ]; then
    echo "ERROR: CheckMK agent directory not found: $INSTALL_DIR"
    echo "Please ensure CheckMK agent is installed."
    exit 1
fi

if [ ! -d "$SCRIPTS_DIR" ]; then
    echo "ERROR: Scripts directory not found: $SCRIPTS_DIR"
    exit 1
fi

if ! command -v kubectl >/dev/null 2>&1; then
    echo "WARNING: kubectl not found in PATH"
    echo "Please ensure kubectl is installed and accessible"
fi

echo "Copying scripts..."
cp -v "$SCRIPTS_DIR"/check_longhorn_* "$INSTALL_DIR/"

echo "Setting permissions..."
chmod 755 "$INSTALL_DIR"/check_longhorn_*

echo ""
echo "Installation complete!"
echo ""
echo "Testing checks..."
echo ""

for script in "$INSTALL_DIR"/check_longhorn_*; do
    echo "Running: $(basename "$script")"
    "$script"
    echo ""
done

echo "Done! Services should appear in CheckMK after service discovery."
