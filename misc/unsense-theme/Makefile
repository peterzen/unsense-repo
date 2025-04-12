PLUGIN_NAME=		theme-unsense
PLUGIN_VERSION=		0.1
PLUGIN_REVISION=    2
PLUGIN_COMMENT=		Unsense theme
PLUGIN_MAINTAINER=	peter@froggle.org


# collect build artefacts from the source tree
install: 
	# @rm -rf work
	@mkdir -p work/pkg work/src ${DESTDIR}/usr/local/opnsense/www/themes/theme-unsense
	@cp -rv  build/* ${DESTDIR}/usr/local/opnsense/www/themes/theme-unsense
	@mkdir -p ${DESTDIR}${LOCALBASE}/opnsense/version
	@cat ${TEMPLATESDIR}/version | sed ${SED_REPLACE} > "${DESTDIR}${LOCALBASE}/opnsense/version/${PLUGIN_NAME}"


.include "../../Mk/plugins.mk"
