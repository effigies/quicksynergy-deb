#!/bin/bash
#
# 2015 Chris Markiewicz

export QUILT_PATCHES=debian/patches
export QUILT_REFRESH_ARGS="-p ab --no-timestamps --no-index"

if [ -e build ]; then rm -r build; fi

mkdir build
pushd build
    sudo apt-get build-dep -y quicksynergy
    apt-get source quicksynergy
    pushd quicksynergy-0.9
        quilt push
        quilt import ../../socks_tunnel.diff
        quilt pop
        cat ../../changelog debian/changelog > debian/changelog.new
        mv debian/changelog.new debian/changelog
        pushd
            dpkg-source -b quicksynergy-0.9
        pushd
        dpkg-buildpackage -uc -us
    popd
    cp quicksynergy_0.9-*.deb ..
popd

rm -r build
