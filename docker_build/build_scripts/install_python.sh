# Copyright (c) 2019 Michael Vilim
#
# This file is part of the taserver-linux library. It is currently hosted at
# https://github.com/mvilim/taserver-linux
#
# taserver-linux is licensed under the AGPL. A copy of the license can be
# found in the root folder of the project.

set -e
mkdir python37
curl https://www.python.org/ftp/python/3.7.2/python-3.7.2.post1-embed-win32.zip | bsdtar -xvf- -C python37
curl https://bootstrap.pypa.io/get-pip.py -o python37/get-pip.py
wine python python37/get-pip.py
# see https://bugs.python.org/issue34841
rm python37/python37._pth
wine pip install gevent
