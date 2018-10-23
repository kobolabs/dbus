#!/bin/bash

[ ! -e configure ] && NOCONFIGURE=1 ./autogen.sh

CFLAGS="-I/chroot/include" LIBS="-L/chroot/lib -lexpat" ./configure --with-sysroot=/chroot --prefix= --host=arm-linux --disable-abstract-sockets --without-x --disable-static --disable-launchd --disable-systemd --disable-xml-docs --disable-doxygen-docs --disable-xml-docs

make -j8
make DESTDIR=/chroot install
