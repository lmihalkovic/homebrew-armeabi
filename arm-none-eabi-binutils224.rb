require 'formula'

class ArmNoneEabiBinutils224 < Formula

    homepage 'http://www.gnu.org/software/binutils/binutils.html'
    url 'http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.bz2'
    mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.bz2'
    sha1 '7ac75404ddb3c4910c7594b51ddfc76d4693debb'

    keg_only 'Enable installation of several binutils versions'

    depends_on 'gmp'
    depends_on 'mpfr'
#    depends_on 'mpc'
#    depends_on 'isl'
    depends_on 'cloog'
    depends_on 'libelf'
#    depends_on 'expat'

    def install
        args = [
    #${BINUTILS_CONFIG_OPTS} \
    "--target=arm-none-eabi",
                "--with-gmp=#{Formula.factory('gmp').prefix}",
                "--with-mpfr=#{Formula.factory('mpfr').prefix}",
#                "--with-ppl=#{Formula.factory('ppl11').prefix}",
                "--with-cloog=#{Formula.factory('cloog').prefix}",

            "--prefix=#{prefix}",
            "--infodir=#{info}",
            "--mandir=#{man}",
    "--enable-multilibs",
    "--disable-nls",
    "--disable-werror",
    "--enable-interwork",
    "--enable-plugins",
#    "--with-sysroot=$INSTALLDIR_NATIVE/arm-none-eabi",
#    "--with-pkgversion=$PKGVERSION",

        ]

        mkdir 'build' do
            system "../configure", *args

            system "make"
            system "make install"
        end

        info.rmtree # info files conflict with native binutils
    end
end
