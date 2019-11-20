# Copyright (c) 2019 Michael Vilim
#
# This file is part of the taserver-linux library. It is currently hosted at
# https://github.com/mvilim/taserver-linux
#
# taserver-linux is licensed under the AGPL. A copy of the license can be
# found in the root folder of the project.

# enable multilib
pacman -Sy --noconfirm grep
cat /etc/pacman.conf | grep -A 1 \\[multilib\\] | sed 's/\#//g' >> /etc/pacman.conf
pacman -Sy --noconfirm vim python python-pip git xorg-server-xvfb wine winetricks
