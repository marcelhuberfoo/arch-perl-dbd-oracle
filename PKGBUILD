# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>

_perlmod=DBD-Oracle
_modnamespace=DBD
pkgname=perl-dbd-oracle
pkgver=1.74
pkgrel=3
pkgdesc="DBD::Oracle - Oracle database driver for the DBI module"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
depends=('oracle-instantclient-basic>=10.1' 'perl-dbi>=1.51')
makedepends=('oracle-instantclient-sdk>=10.1' 'oracle-instantclient-sqlplus' 'perl-data-dumper')
options=('!emptydirs')
source=(oracle.mk
	"http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('05392bc442845b4e4b5d24891cd8a970039db2e0b0c11a994f33b4cdd72567f5cd86c9a8b7ed7d6cc48774bace0544d9af0223f1bb52daf321286638f02e1241'
            '08e2b39a9102bc7aaa947d8104b99fce40285781f8482f08b4571fa866198f6f36f089771808a6c53eede3eb3b573da6ec7ba6de16d1d5023ceae6be60d3f8f2')

build() {
	cd "${_perlmod}-${pkgver}"

	# prefer libs from instantclient installation
	export LD_LIBRARY_PATH=/usr/lib
	# prefer use of instantclient sqlplus binary
	export PATH=/usr/bin:$PATH
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor DESTDIR=${pkgdir} -l -m "${srcdir}/oracle.mk"
	make
}

check() {
	cd "${_perlmod}-${pkgver}"
	# prefer libs from instantclient installation
	export LD_LIBRARY_PATH=/usr/lib
	make test
}

package() {
	cd "${_perlmod}-${pkgver}"
	make install DESTDIR="$pkgdir/"
}
