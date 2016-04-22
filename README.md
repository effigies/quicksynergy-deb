Build script for QuickSynergy with SOCKS tunnel
===============================================

This script builds a Debian package for quicksynergy, modified to allow users
to use a SOCKS tunnel instead of a direct connection.

Typical use:

    ./buildpkg.sh
    sudo dpkg -i quicksynergy_0.9-2ubuntu2_amd64.deb

Note that the script does call `sudo apt-get build-dep`, but otherwise
operates without privileges.
