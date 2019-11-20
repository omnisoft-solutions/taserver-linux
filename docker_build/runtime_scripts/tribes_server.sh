#!/bin/bash
#
# Copyright (c) 2019 Michael Vilim
#
# This file is part of the taserver-linux library. It is currently hosted at
# https://github.com/mvilim/taserver-linux
#
# taserver-linux is licensed under the AGPL. A copy of the license can be
# found in the root folder of the project.

# Hack to get around "Fatal Python error: _Py_HashRandomization_Init: failed to get random numbers to initialize Python" on startup. Not sure of root cause.
export PYTHONHASHSEED=$RANDOM
cd taserver

if [ ! -f TAMods-Server.dll ]; then
   python download_compatible_controller.py
fi

if [ ! -f udpproxy.exe ]; then
   python download_udpproxy.py
fi

wine python start_taserver_firewall.py&
wine python start_game_server_launcher.py
