<!---
Copyright (c) 2019 Michael Vilim

This file is part of the taserver-linux library. It is currently hosted at
https://github.com/mvilim/taserver-linux

taserver-linux is licensed under the AGPL. A copy of the license can be
found in the root folder of the project.
-->

[![Docker image](https://shields.beevelop.com/docker/image/image-size/mvilim/taserver-linux/latest.svg)](https://hub.docker.com/r/mvilim/taserver-linux)

## taserver-linux

This repository provides a Docker image for hosting a Tribes Ascend server on Linux (using Wine). The server implementation is provided by [https://github.com/Griffon26/taserver](https://github.com/Griffon26/taserver); this repository simply wraps that implementation in a Docker image for use on Linux (along with the necessary configuration and patches). This server uses Wine to enable the Windows-compatible server to run on Linux.

### Running

Docker is the only dependency. It must be installed before you can use this to launch a server.

To run a server, you will need to clone this repository recursively (to load the [default GOTY server settings](https://github.com/mcoot/tamods-server-gotylike)):

```
git clone --recursive https://github.com/mvilim/taserver-linux
cd taserver-linux
./run
```

### Configuration

By default, the image will run a GOTY-configured server using the configuration in `gameserverlauncher.ini`. This .ini file will be merged with the default .ini from the original taserver.

To modify Tribes server settings, you will need to provide the necessary lua scripts and set the `controller_config` option under `[game_server]`. By default, the GOTY server settings will be used. tamods-server-gotylike/gotylike/serversettings.lua must also be modified to change the default server admin username and password. See the [TA mods server documentation for more info](https://www.tamods.org/docs/doc_srv_api_overview.html).

Because the server runs inside a Docker container, you will need to manually provide an internal ip address for LAN play (using the `internal_ip` option under `[game_server]`).

To run a login server as well as a game server (the login server ip will need to be configured in gameserverlauncher.ini):

```
./run ./tribes_server_with_login
```

### Building

By default, the Docker image will be pulled from Docker Hub. To build the image yourself:

```
./docker_build/build.sh
```

### Licensing

This project is licensed under the [AGPL](https://github.com/mvilim/taserver-linux/blob/master/LICENSE).
