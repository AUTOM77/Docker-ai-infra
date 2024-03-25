#!/bin/bash

set -e

sleep 3

echo 'import gradio as gr
from fastapi import FastAPI

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

app = FastAPI()
app = gr.mount_gradio_app(app, demo, path="/")
' | tee /tmp/app.py


if [ ! -e "/opt/run/app.py" ]; then
    sudo mv /tmp/app.py /opt/run/app.py
fi

if [ ! -e "/usr/bin/ai-infra" ]; then
    if [ -n "$AI_SOCKET" ]; then
        # echo "mamba run hypercorn -b unix:$AI_SOCKET -w 4 /opt/run/app:app" > /usr/bin/ai-infra
        echo "mamba run hypercorn -b unix:$AI_SOCKET /opt/run/app:app" > /tmp/ai-infra
    else
        echo "mamba run hypercorn -b '[::]:9100' /opt/run/app:app"  > /tmp/ai-infra
    fi
    sudo mv /tmp/ai-infra /usr/bin/ai-infra
    sudo chmod +x /usr/bin/ai-infra
fi

exec "$@"