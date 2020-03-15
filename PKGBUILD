#!/bin/bash
#Script build.sh replaces VERSION_PLACEHOLDER with current version while creating PKGBUILD.
pkgname=micsync-thunar
pkgver=0.0.1
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/micdmy/micsync-thunar/"
license=('GPL3')
depends=('thunar>=1.8' 'micsync')
#makedepends=('')
source=('git+https://github.com/micdmy/micsync-thunar/')

package() {
	install -D -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/source/micsync-thunar-install-actions"
	install -D -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/source/micsync-thunar-remove-actions"
	mkdir -p "${pkgdir}/etc/${pkgname}"
	cp ${srcdir}/${pkgname}/source/config/* ${pkgdir}/etc/${pkgname}
}

md5sums=('SKIP')
