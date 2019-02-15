# Copyright (c) 2019 Michael Vilim
#
# This file is part of the taserver-linux library. It is currently hosted at
# https://github.com/mvilim/taserver-linux
#
# taserver-linux is licensed under the AGPL. A copy of the license can be
# found in the root folder of the project.

CMD_OVERRIDE=$1
TA_SERVER_DIR=/home/tribes/taserver/
DATA_DIR=$TA_SERVER_DIR/data/
INI_NAME=gameserverlauncher.ini
GOTY_CONFIG_NAME=tamods-server-gotylike
IMAGE_NAME=mvilim/taserver-linux
PORT_PUBLICATIONS="-p 7777:7777/tcp -p 7777:7777/udp -p 7778:7778/tcp -p 7778:7778/udp -p 9000:9000/tcp -p 9001:9001/tcp -p 9002:9002/udp"
INI_MOUNT="-v $(pwd)/$INI_NAME:$DATA_DIR/runtime_$INI_NAME:ro"
SERVER_CONFIG_MOUNT="-v $(pwd)/$GOTY_CONFIG_NAME:$DATA_DIR/$GOTY_CONFIG_NAME:ro"
# SYS_PTRACE is added to allow DLL injection (we need process_vm_writev, see https://docs.docker.com/engine/security/seccomp/)
CAPABILITIES="--cap-add SYS_PTRACE"

docker run $CAPABILITIES -it --rm $PORT_PUBLICATIONS $INI_MOUNT $SERVER_CONFIG_MOUNT $IMAGE_NAME $CMD_OVERRIDE
