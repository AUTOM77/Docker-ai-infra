#!/bin/bash

set -e

sleep 3

if [ ! -e "/opt/run/app.py" ]; then

cat <<EOF | tee /opt/run/app.py
import gradio as gr
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
EOF
fi

exec "$@"