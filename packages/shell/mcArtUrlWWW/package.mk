################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="mcArtUrlWWW"
PKG_VERSION="4.8.7"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.midnight-commander.org/"
#PKG_URL="http://www.midnight-commander.org/downloads/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_URL="http://www.midnight-commander.org/downloads/mc-$PKG_VERSION.tar.bz2"
#PKG_SOURCE_DIR="${PKG_NAME}${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain gettext:host glib libssh2 libtool:host ncurses pcre"
PKG_SECTION="shell/filemanager"
PKG_SHORTDESC="mc: free cross-platform filemanager"
PKG_LONGDESC="Midnight Commander - free cross-platform filemanager and clone of Norton Commander"
#PKG_TOOLCHAIN="manual"
#PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET=" \
  --datadir=/storage/.kodi/addons/virtual.system-tools/data \
  --libdir=/storage/.kodi/addons/virtual.system-tools/mclib \
  --sysconfdir=/storage/.kodi/addons/virtual.system-tools/etc \
  --with-screen=ncurses \
  --with-sysroot=$SYSROOT_PREFIX \
  --disable-aspell \
  --without-diff-viewer \
  --disable-doxygen-doc \
  --disable-doxygen-dot \
  --disable-doxygen-html \
  --with-gnu-ld \
  --without-libiconv-prefix \
  --without-libintl-prefix \
  --with-internal-edit \
  --disable-mclib \
  --with-subshell \
  --enable-vfs-extfs \
  --enable-vfs-ftp \
  --enable-vfs-sftp \
  --enable-vfs-tar \
  --without-x"
							
pre_configure_target() { 
	LDFLAGS="$LDFLAGS -lcrypto -lssl"
}


make_target() {
  make CC=$CC CPP=$CPP RANLIB=$RANLIB AR=$AR STRIP=$STRIP LOCAL_ZIP="$CFLAGS" \
       -f unix/Makefile generic
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp zip $INSTALL/usr/bin
    $STRIP $INSTALL/usr/bin/zip
}
