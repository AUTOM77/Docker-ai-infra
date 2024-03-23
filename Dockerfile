FROM monius/docker-ai-infra:base

WORKDIR /opt/run

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["ai-infra"]