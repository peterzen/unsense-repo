#!/bin/bash
set -e

SRC=src
DEST=build

echo "Copying fonts, images, and JS assets..."

cpx "$SRC/fonts/**/*" "$DEST/fonts"
cpx "$SRC/images/**/*" "$DEST/images"
cpx "$SRC/javascripts/**/*" "$DEST/js"