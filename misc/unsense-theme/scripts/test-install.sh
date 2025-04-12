#!/bin/sh
set -e

PKG=work/opnsense-theme-mytheme-1.0.txz

echo "Installing plugin from $PKG"
sudo pkg add -f "$PKG"

echo "Plugin installed. Now go to System > Settings > General to select the theme."
