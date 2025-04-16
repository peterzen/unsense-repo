#!/bin/bash
set -e

SRC=src
DEST=build
INCLUDE_PATH=node_modules/bootstrap-sass/assets/stylesheets

#  silence warnings in bootstrap 3.4.1
SASS_WARN_DEPRECATED=false 

echo "Building CSS..."

# dark color variant
sass \
  -I $INCLUDE_PATH \
  --quiet-deps \
  "$SRC/stylesheets/main-dark.scss" \
  "$DEST/css/dark.css" \
  ${1:+"--source-map"}

# light color variant
sass \
  -I $INCLUDE_PATH \
  --quiet-deps \
  "$SRC/stylesheets/main-light.scss" \
  "$DEST/css/light.css" \
  ${1:+"--source-map"}

cp "$SRC/stylesheets/main.css" "$DEST/css"

# sass \
  # -I $INCLUDE_PATH \
  # "$SRC/stylesheets/main.scss" \
  # "$DEST/css/main.css" \
  # ${1:+"--source-map"}
