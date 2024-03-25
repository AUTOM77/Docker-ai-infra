FROM monius/docker-ai-infra:base

ARG USER=infra

WORKDIR /opt/run

COPY --chown=$USER entrypoint.sh /run/entrypoint.sh

RUN useradd -m -s /bin/bash $USER && \
    chown -R $USER:$USER $WORKDIR

ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["ai-infra"]