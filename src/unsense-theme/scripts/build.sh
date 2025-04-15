#!/bin/bash
set -e

SRC=src
DEST=build
INCLUDE_PATH=node_modules/bootstrap-sass/assets/stylesheets
# TODO
# refactor deprecated calls in SCSS
SASS_WARN_DEPRECATED=false 

echo "Building CSS..."

# dark color variant
sass \
  -I $INCLUDE_PATH \
  "$SRC/stylesheets/main-dark.scss" \
  "$DEST/css/dark.css" \
  ${1:+"--source-map"}

# light color variant
sass \
  -I $INCLUDE_PATH \
  "$SRC/stylesheets/main-light.scss" \
  "$DEST/css/light.css" \
  ${1:+"--source-map"}

cp "$SRC/stylesheets/main.css" "$DEST/css"

# sass \
  # -I $INCLUDE_PATH \
  # "$SRC/stylesheets/main.scss" \
  # "$DEST/css/main.css" \
  # ${1:+"--source-map"}
