# Copyright (c) 2019 Michael Vilim
#
# This file is part of the taserver-linux library. It is currently hosted at
# https://github.com/mvilim/taserver-linux
#
# taserver-linux is licensed under the AGPL. A copy of the license can be
# found in the root folder of the project.

FROM archlinux/base
COPY build_scripts/install_packages.sh /root/
RUN /root/install_packages.sh
RUN useradd -m tribes
WORKDIR /home/tribes
USER tribes
ENV WINEPATH "Z:\\home\\tribes\\python37;Z:\\home\\tribes\\python37\\Scripts"
COPY build_scripts/install_python.sh ./
RUN ./install_python.sh
COPY build_scripts/install_wine.sh ./
RUN ./install_wine.sh
COPY runtime_scripts/tribes_server.sh ./
COPY runtime_scripts/tribes_server_with_login.sh ./
CMD ./tribes_server.sh

EXPOSE 7777/tcp 7777/udp 7778/tcp 7778/udp 9000/tcp 9001/tcp 9002/udp
