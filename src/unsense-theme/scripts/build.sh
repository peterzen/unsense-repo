#!/bin/bash
set -e

SRC=src
DEST=build
INCLUDE_PATH=node_modules/bootstrap-sass/assets/stylesheets

#  silence warnings in bootstrap 3.4.1
SASS_WARN_DEPRECATED=false 

echo "\$version: \"$(date +%s)\";"  > "/tmp/version.scss"

# cp $SRC/javascripts/* $DEST/js/

# dark color variant
echo "Building dark CSS..."
sass \
  -I $INCLUDE_PATH \
  --quiet-deps \
  "$SRC/stylesheets/main-dark.scss" \
  "$DEST/css/dark.css" \
  ${1:+"--source-map"}

# light color variant
echo "Building light CSS..."
sass \
  -I $INCLUDE_PATH \
  --quiet-deps \
  "$SRC/stylesheets/main-light.scss" \
  "$DEST/css/light.css" \
  ${1:+"--source-map"}

echo "Building main CSS..."
sass \
  -I $INCLUDE_PATH \
  "$SRC/stylesheets/main.scss" \
  "$DEST/css/main.css" \
  ${1:+"--source-map"}

# put an empty dashboard.css file so that the
# compiled main.css is in effect
touch $DEST/css/dashboard.css