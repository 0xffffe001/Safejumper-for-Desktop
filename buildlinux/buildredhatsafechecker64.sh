#!/bin/bash
# Run this script from the buildlinux folder to build a debian/ubuntu package
qmake DEFINES+="Q_OS_REDHAT" ../src
make
cp safechecker/safechecker linuxfiles
cp launchopenvpn/launchopenvpn linuxfiles
cp netdown/netdown linuxfiles
cp openvpn64 linuxfiles/openvpn
cp -r env64 linuxfiles/env

# Then the content of linuxfiles mostly goes into /opt/safechecker/.

# To package debian/ubuntu do the following:

tar --transform "s/^linuxfiles/safechecker-$1/" -zcpvf ~/rpmbuild/SOURCES/safechecker-$1.tar.gz linuxfiles
rpmbuild --define "debug_package %{nil}" -ba --sign -v ./safechecker.spec

