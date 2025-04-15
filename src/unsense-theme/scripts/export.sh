#!/bin/bash
set -e

DEST_ROOT=../../misc/unsense-theme/src/opnsense
DEST=$DEST_ROOT/www/themes/unsense

echo "Exporting artefacts to $DEST"

rm -rf $DEST_ROOT
mkdir -p "$DEST"
cp -rv build "$DEST"