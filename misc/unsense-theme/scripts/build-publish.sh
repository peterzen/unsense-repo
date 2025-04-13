#!/bin/sh

ABI=FreeBSD:14:amd64
PKGDIR=work/pkg

make package
../../Scripts/pkg-repo.sh ${PKGDIR}

cp -rv ${PKGDIR} /srv/www/unsense-repo/${ABI}
