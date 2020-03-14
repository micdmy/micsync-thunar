!/bin/bash
#Script build.sh replaces VERSION_PLACEHOLDER with current version while creating PKGBUILD.
pkgname=micsync-thunar
pkgver=0.0.1
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/micdmy/micsync-thunar"
license=('GPL3')
depends=('thunar>=1.8' 'micsync')
#makedepends=('')
source=('https://github.com/micdmy/micsync-thunar.git')

package() {
	install -D -t "$pkgdir/usr/bin" "$srcdir/source/micdmy-thunar-install-actions"
	install -D -t "$pkgdir/usr/bin" "$srcdir/source/micdmy-thunar-remove-actions"
}

