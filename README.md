# Docker-ai-infra

[![CI Status](https://github.com/AUTOM77/Docker-ai-infra/workflows/build/badge.svg)](https://github.com/AUTOM77/Docker-ai-infra/actions?query=workflow:build)
[![CI Status](https://github.com/AUTOM77/Docker-ai-infra/workflows/verify/badge.svg)](https://github.com/AUTOM77/Docker-ai-infra/actions?query=workflow:verify)
[![Docker Pulls](https://flat.badgen.net/docker/pulls/monius/docker-ai-infra)](https://hub.docker.com/r/monius/docker-ai-infra)
[![Code Size](https://img.shields.io/github/languages/code-size/AUTOM77/Docker-ai-infra)](https://github.com/AUTOM77/Docker-ai-infra)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Open Issues](https://img.shields.io/github/issues/AUTOM77/Docker-ai-infra)](https://github.com/AUTOM77/Docker-ai-infra/issues)

> AI Infra with MicroMamba inside contrainer for: `linux/amd64`, `linux/arm64`, and `linux/ppc64le`;

🚧 Building .. 🚧

```bash
doas podman run --name aii -it monius/docker-ai-infra /bin/bash

doas podman run --name aii -p 127.0.0.1:9100:9100 -itd monius/docker-ai-infra
doas podman run --name aii -p 127.0.0.1:9100:9100 -it monius/docker-ai-infra /bin/bash

doas podman run --privileged -itd \
    --name aii \
    --group-add keep-groups \
    -p 127.0.0.1:9100:9100 \
    -v ~/demo/:/opt/run/:ro \
    -v /DATA:/opt/run/dataset:ro \
    monius/docker-ai-infra

doas podman logs aii
doas podman inspect -f '{{.NetworkSettings.IPAddress}}' aii
doas podman rm -f $(doas podman ps -a -q)
doas podman rmi -f $(doas podman images -a -q)
```