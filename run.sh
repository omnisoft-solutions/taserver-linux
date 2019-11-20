# Copyright (c) 2019 Michael Vilim
#
# This file is part of the taserver-linux library. It is currently hosted at
# https://github.com/mvilim/taserver-linux
#
# taserver-linux is licensed under the AGPL. A copy of the license can be
# found in the root folder of the project.

CMD_OVERRIDE=$1
IMAGE_NAME=mvilim/taserver-linux
PORT_PUBLICATIONS="-p 7777:7777/tcp -p 7777:7777/udp -p 7778:7778/tcp -p 7778:7778/udp -p 9000:9000/tcp -p 9001:9001/tcp -p 9002:9002/udp"
CAPABILITIES="--cap-add SYS_PTRACE"

GAME_MOUNT="-v $(pwd)/tribes_game:/home/tribes/tribes_game:ro"
SERVER_MOUNT="-v $(pwd)/taserver:/home/tribes/taserver"
GOTY_MOUNT="-v $(pwd)/tamods-server-gotylike:/home/tribes/taserver/data/gamesettings/gotylike"

docker run $CAPABILITIES -it --rm $PORT_PUBLICATIONS $GAME_MOUNT $SERVER_MOUNT $GOTY_MOUNT $IMAGE_NAME $CMD_OVERRIDE
