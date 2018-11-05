# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Compare, merge files and folders using simple, powerful commands."
HOMEPAGE="http://www.scootersoftware.com"
SRC_URI="
    amd64?  ( http://www.scootersoftware.com/${P}.x86_64.tar.gz )
	x86?	( http://www.scootersoftware.com/${P}.i386.tar.gz )"

LICENSE="Beyond_Compare_V4"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="caja kde konq nautilus nemo thunar"

DEPEND="dev-util/patchelf"
RDEPEND="dev-qt/qtcore:4"
RDEPEND="dev-qt/qtgui:4"

src_install()
{
	mkdir -p "${D}/"usr/lib/beyondcompare
	cp "${S}/"{bcmount.sh,bcmount32,bcmount64,BCompare,BCompare.mad,lib7z.so,libQt4Pas.so.5} "${D}/"usr/lib/beyondcompare/
	patchelf --set-rpath '$ORIGIN/' "${D}/"usr/lib/beyondcompare/BCompare

	mkdir -p "${D}/"usr/bin
	ln -s /usr/lib/beyondcompare/BCompare "${D}/"usr/bin/bcompare

	mkdir -p "${D}/"usr/share/applications
	cp "${S}/"bcompare.desktop "${D}/"usr/share/applications/

	mkdir -p "${D}/"usr/share/doc/beyondcompare
	cp "${S}/"help/* "${D}/"usr/share/doc/beyondcompare/

	mkdir -p "${D}/"usr/share/mime/packages
	cp "${S}/"bcompare.xml "${D}/"usr/share/mime/packages/

	mkdir -p "${D}/"usr/share/pixmaps
	cp "${S}/"{bcompare.png,bcomparefull32.png,bcomparehalf32.png} "${D}/"usr/share/pixmaps/

	if use caja
	then
		mkdir -p "${D}/"usr/lib/caja/extensions-3.0
		if use amd64
		then
			cp "${S}/"ext/bcompare-ext-caja.amd64.so "${D}/"usr/lib/caja/extensions-3.0/
		elif use x86
		then
			cp "${S}/"ext/bcompare-ext-caja.i386.so "${D}/"usr/lib/caja/extensions-3.0/
		fi
	fi

	if use kde
	then
		mkdir -p "${D}/"usr/lib/kde4
		if use amd64
		then
			cp "${S}/"ext/bcompare_ext_kde.amd64.so "${D}/"usr/lib/kde4/
		elif use x86
		then
			cp "${S}/"ext/bcompare_ext_kde.i386.so "${D}/"usr/lib/kde4/
		fi
	fi

	if use konq
	then
		mkdir -p "${D}/"usr/lib/kde4
		if use amd64
		then
			cp "${S}/"ext/bcompare_ext_konq.amd64.so "${D}/"usr/lib/kde4/
		elif use x86
		then
			cp "${S}/"ext/bcompare_ext_konq.i386.so "${D}/"usr/lib/kde4/
		fi
	fi

	if use nautilus
	then
		mkdir -p "${D}/"usr/lib/nautilus/extensions-3.0
		if use amd64
		then
			cp "${S}/"ext/bcompare-ext-nautilus.amd64.so "${D}/"usr/lib/nautilus/extensions-3.0/
		elif use x86
		then
			cp "${S}/"ext/bcompare-ext-nautilus.i386.so "${D}/"usr/lib/nautilus/extensions-3.0/
		fi
	fi

	if use nemo
	then
		mkdir -p "${D}/"usr/lib/nemo/extensions-3.0
		if use amd64
		then
			cp "${S}/"ext/bcompare-ext-nemo.amd64.so "${D}/"usr/lib/nemo/extensions-3.0/
		elif use x86
		then
			cp "${S}/"ext/bcompare-ext-nemo.i386.so "${D}/"usr/lib/nemo/extensions-3.0/
		fi
	fi

	if use thunar
	then
		mkdir -p "${D}/"usr/lib/thunarx-2
		if use amd64
		then
			cp "${S}/"ext/bcompare-ext-thunarx.amd64.so "${D}/"usr/lib/thunarx-2/
		elif use x86
		then
			cp "${S}/"ext/bcompare-ext-thunarx.i386.so "${D}/"usr/lib/thunarx-2/
		fi
	fi
}

