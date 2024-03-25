FROM monius/docker-ai-infra:base

USER infra
WORKDIR /opt/run

COPY --chown=infra entrypoint.sh /run/entrypoint.sh

RUN sudo useradd -m -s /bin/bash -G sudo $USER && \
        echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$USER

ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["ai-infra"]