#!/bin/sh

set -e

sleep 3

_ARCH=$(arch)
DEV_PATH="/opt/dev"
MINI_CONDA="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-${_ARCH}.sh" 

curl -fsSL "$MINI_CONDA" -o /tmp/conda.sh
chmod +x /tmp/conda.sh && sh /tmp/conda.sh -b -p "$DEV_PATH/conda"

cat <<EOF | tee -a "$HOME"/.bashrc

if [ -f "$DEV_PATH/conda/etc/profile.d/conda.sh" ]; then
    . "$DEV_PATH/conda/etc/profile.d/conda.sh"
else
    export PATH="$DEV_PATH/conda/bin:$PATH"
fi

EOF


# /usr/bin/mamba shell init -s bash -p /opt/dev/mamba
# . "$HOME/.bashrc"

# micromamba -y create -n aii python=3.11 gradio -c conda-forge
# micromamba activate aii
exec "$@"