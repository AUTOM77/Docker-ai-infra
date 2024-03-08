#!/bin/bash

set -e

sleep 3

cat <<EOF | tee /opt/demo.py
import gradio as gr

_css = gr.Theme.from_hub("gradio/monochrome")

demo = gr.Interface(
    theme=_css,
    fn=lambda x: x,
    title="3D(Demo)",
    inputs=gr.Model3D(label="Input"),
    outputs=[
        gr.Model3D(clear_color=(0.0, 0.0, 0.0, 0.0), label="Output"),
    ],
    cache_examples=False,
    allow_flagging="never",
)

demo.launch(share=False, max_threads=30, server_port=9100)
EOF

case $(arch) in
    aarch64) _ARCH="linux-aarch64" ;;
    ppc64le) _ARCH="linux-ppc64le" ;;
    *) _ARCH="linux-64" ;;
esac

DEV_PATH="/opt/dev"
MICRO_MAMBA="https://micro.mamba.pm/api/micromamba/${_ARCH}/latest"

curl -fsSL "$MICRO_MAMBA" | tar -xvj bin/micromamba
mv bin/micromamba /usr/bin/mamba
mamba shell init -s bash -p $DEV_PATH/mamba
source ~/.bashrc
micromamba create -n aii python=3.11 gradio -c conda-forge -y
# micromamba run -n aii python /opt/demo.py

exec "$@"