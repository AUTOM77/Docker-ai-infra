FROM monius/docker-ai-infra:base

USER infra
WORKDIR /opt/run

COPY --chown=infra entrypoint.sh /run/entrypoint.sh

RUN echo $USER $WORKDIR

ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["ai-infra"]