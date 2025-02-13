PKG_NAME="mgba"
PKG_VERSION="5d48e0744059ebf38a4e937b256ffd5df4e0d103"
PKG_LICENSE="MPLv2.0"
PKG_SITE="https://github.com/libretro/mgba"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="mGBA Game Boy Advance Emulator"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-C ../ -f Makefile.libretro"

if [ "${ARCH}" = "arm" ]; then
  PKG_MAKE_OPTS_TARGET+=" platform=unix-armv"
fi

if target_has_feature neon ; then
  PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
fi

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
    cp -v ../mgba_libretro.so ${INSTALL}/usr/lib/libretro/
}
