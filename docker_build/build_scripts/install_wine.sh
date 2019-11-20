# Copyright (c) 2019 Michael Vilim
#
# This file is part of the taserver-linux library. It is currently hosted at
# https://github.com/mvilim/taserver-linux
#
# taserver-linux is licensed under the AGPL. A copy of the license can be
# found in the root folder of the project.

set -e
#see https://github.com/Winetricks/winetricks/issues/934 for an explanation of Xvfb usage
Xvfb :1 &
export DISPLAY=":1"
export WINEPREFIX=/home/tribes/.wine64
export WINEARCH=win32
WINEDLLOVERRIDES="mscoree,mshtml=" wine wineboot && wineserver -w
winetricks -q vcrun2017
