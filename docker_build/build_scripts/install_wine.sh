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
# a 64 bit version of wine is required for udpproxy
export WINEPREFIX=/home/tribes/.wine64
WINEDLLOVERRIDES="mscoree,mshtml=" wine wineboot && wineserver -w
winetricks -q vcrun2015
# during DLL injection, I get a stack smashing panic on 64 bit wine, so we use 32 bit wine to run the Tribes server
export WINEPREFIX=/home/tribes/.wine32
export WINEARCH=win32
WINEDLLOVERRIDES="mscoree,mshtml=" wine wineboot && wineserver -w
winetricks -q vcrun2015
