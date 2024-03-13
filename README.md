# Docker-ai-infra

[![CI Status](https://github.com/AUTOM77/Docker-ai-infra/workflows/build/badge.svg)](https://github.com/AUTOM77/Docker-ai-infra/actions?query=workflow:build)
[![CI Status](https://github.com/AUTOM77/Docker-ai-infra/workflows/verify/badge.svg)](https://github.com/AUTOM77/Docker-ai-infra/actions?query=workflow:verify)
[![Docker Pulls](https://flat.badgen.net/docker/pulls/monius/docker-ai-infra)](https://hub.docker.com/r/monius/docker-ai-infra)
[![Code Size](https://img.shields.io/github/languages/code-size/AUTOM77/Docker-ai-infra)](https://github.com/AUTOM77/Docker-ai-infra)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Open Issues](https://img.shields.io/github/issues/AUTOM77/Docker-ai-infra)](https://github.com/AUTOM77/Docker-ai-infra/issues)

> AI Infra with MicroMamba inside contrainer for: `linux/amd64`, `linux/arm64`, and `linux/ppc64le`;

🚧 Building .. 🚧

For default with unix socket,
```bash
AI_SOCKET='/dev/shm/infra.sock'

doas podman run --restart=always -itd \
    --name ai-infra \
    -e AI_SOCKET=$AI_SOCKET \
    -v /dev/shm:/dev/shm:rw \
    -v ~/demo:/opt/run:rw \
    -v /DATA:/opt/run/dataset:rw \
    monius/docker-ai-infra
```

If not works,
```bash
POD_DEFAULT='10.88.0.1'
doas podman run --privileged -itd \
    --name ai-infra \
    --group-add keep-groups \
    -p $POD_DEFAULT:9100:9100 \
    -v ~/demo/:/opt/run/:ro \
    -v /DATA:/opt/run/dataset:ro \
    monius/docker-ai-infra
```

```bash
doas podman run --name ai-infra -it monius/docker-ai-infra /bin/bash
doas podman exec -it ai-infra /bin/bash
doas podman run --name ai-infra -p 127.0.0.1:9100:9100 -itd monius/docker-ai-infra
doas podman run --name ai-infra -p 127.0.0.1:9100:9100 -it monius/docker-ai-infra /bin/bash

doas podman run --privileged -itd \
    --name ai-infra \
    --group-add keep-groups \
    -p 127.0.0.1:9100:9100 \
    -v ~/demo/:/opt/run/:ro \
    -v /DATA:/opt/run/dataset:ro \
    monius/docker-ai-infra

doas podman logs ai-infra
doas podman inspect -f '{{.NetworkSettings.IPAddress}}' ai-infra
doas podman rm -f $(doas podman ps -a -q)
doas podman rmi -f $(doas podman images -a -q)
```