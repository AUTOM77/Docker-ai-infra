FROM monius/docker-ai-infra:base

WORKDIR /opt/run

RUN echo $WORKDIR

COPY entrypoint.sh /run/entrypoint.sh

ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["ai-infra"]