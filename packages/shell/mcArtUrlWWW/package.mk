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
PKG_URL="http://www.midnight-commander.org/downloads/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="${PKG_NAME}${PKG_VERSION}"
PKG_DEPENDS_TARGET="glib slang toolchain glib"
PKG_SECTION="shell/filemanager"
PKG_SHORTDESC="mc: free cross-platform filemanager"
PKG_LONGDESC="Midnight Commander - free cross-platform filemanager and clone of Norton Commander"
#PKG_TOOLCHAIN="manual"
#PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
							--exec-prefix=/usr \
							--without-gpm-mouse \
							--disable-vfs-cpio \
							--disable-vfs-fish \
							--disable-vfs-sfs \
							--enable-vsf-extfs \
							--without-mmap \
								--with-subshell \
							--with-edit \
							--without-x \
							--enable-charset \
							--enable-background \
							--with-screen=slang \
							fu_cv_sys_stat_statfs2_bsize=yes"
							
pre_configure_target() { 
	export LDFLAGS="$LDFLAGS -lvchiq_arm"
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
