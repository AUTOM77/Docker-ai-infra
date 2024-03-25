FROM monius/docker-ai-infra:base

USER infra
WORKDIR /opt/run

RUN echo $USER $WORKDIR

COPY entrypoint.sh /run/entrypoint.sh

ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["ai-infra"]