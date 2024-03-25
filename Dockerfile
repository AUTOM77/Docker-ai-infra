FROM monius/docker-ai-infra:base

USER infra

COPY entrypoint.sh /run/entrypoint.sh

ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["ai-infra"]