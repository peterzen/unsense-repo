#!/bin/sh
set -e

PLUGIN_NAME="opnsense-theme-unsense"
VERSION="1.0"
PKG_NAME="${PLUGIN_NAME}-${VERSION}.txz"
OUTDIR="repo/FreeBSD_14_amd64"
UNPACKED="${OUTDIR}/unpacked"

mkdir -p "$UNPACKED/usr/local/opnsense/www/themes/unsense"
cp -R build/* "$UNPACKED/usr/local/opnsense/www/themes/unsense/"

cat > "$UNPACKED/+MANIFEST" <<EOF
name: ${PLUGIN_NAME}
version: "${VERSION}"
comment: "Custom OPNsense Theme"
maintainer: you@example.com
categories: [themes]
prefix: /
licenselogic: single
licenses: [BSD2CLAUSE]
www: https://github.com/yourname/unsense-theme
arch: any
origin: ${PLUGIN_NAME}
EOF
echo Creating "$OUTDIR/$PKG_NAME"
tar -C "$UNPACKED" -Jcvf "$OUTDIR/$PKG_NAME" +MANIFEST usr
# rm -rf "$UNPACKED"
