#!/bin/sh
set -e

pkg -o COMPRESSION_FORMAT=txz repo $1
