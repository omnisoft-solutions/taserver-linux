# Copyright (c) 2019 Michael Vilim
#
# This file is part of the taserver-linux library. It is currently hosted at
# https://github.com/mvilim/taserver-linux
#
# taserver-linux is licensed under the AGPL. A copy of the license can be
# found in the root folder of the project.

import configparser
import sys

def merge(output_file, config_files):
    parser = configparser.ConfigParser()
    for cf in config_files:
        parser.read(cf)
    with open(output_file, 'w') as combined_file:
        parser.write(combined_file)

if __name__ == '__main__':
    merge(sys.argv[1], sys.argv[2:])
