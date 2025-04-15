#!/bin/sh

ABI=FreeBSD:14:amd64
PKGDIR=misc/unsense-theme/work/pkg
DEST_DIR=/srv/www/public_html/unsense-repo/${ABI}

make package
./Scripts/pkg-repo.sh ${PKGDIR}

mkdir -p ${DEST_DIR}

cp -rv ${PKGDIR}/* ${DEST_DIR}
