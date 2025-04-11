#!/bin/sh
set -e

# Optional: customize target ABI folder
ABI="FreeBSD:14:amd64"
REPO_DIR="repo/${ABI}"

mkdir -p "${REPO_DIR}"

echo "[*] Generating pkg repo index in ${REPO_DIR}"
pkg repo "${REPO_DIR}"

echo "[✓] Done:"
ls -lh "${REPO_DIR}"/meta.txz "${REPO_DIR}"/packagesite.pkg
