#!/bin/sh

set -e

sleep 3

case $(arch) in
    x86_64) _ARCH="linux-64" ;;
    aarch64) _ARCH="linux-aarch64" ;;
    ppc64le) _ARCH="linux-ppc64le" ;;
    *) echo "Unsupported architecture"; exit 1 ;;
esac

MICRO_MAMBA="https://micro.mamba.pm/api/micromamba/${_ARCH}/latest"

echo $MICRO_MAMBA
curl -fsSL $MICRO_MAMBA | tar -xvj bin/micromamba
# mv bin/micromamba /usr/bin/mamba
# mamba shell init -s bash -p /opt/dev/mamba

exec "$@"