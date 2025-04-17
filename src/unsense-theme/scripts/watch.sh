#!/bin/bash
set -e

SRC=src
DEST=build
SASS_WARN_DEPRECATED=false
INCLUDE_PATH=node_modules/bootstrap-sass/assets/stylesheets

chokidar "$SRC/stylesheets/**/*" "$src/javascripts/*" \
    -c "yarn build:dev" \
    --initial \
    --verbose