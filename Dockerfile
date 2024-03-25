FROM monius/docker-ai-infra:base

COPY entrypoint.sh /run/entrypoint.sh

ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["ai-infra"]