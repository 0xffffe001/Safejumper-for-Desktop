#!/bin/bash
VERSION=2017.04.26
QTVERSION=5.7.0
OLDPATH=$PATH
./cleanup.sh
export PATH=../../qt-$QTVERSION-32bit/qtbase/bin:$OLDPATH
./buildredhatsafechecker32.sh $VERSION
./cleanup.sh
export PATH=../../qt-$QTVERSION-64bit/qtbase/bin:$OLDPATH
./buildredhatsafechecker64.sh $VERSION
./cleanup.sh
export PATH=$OLDPATH