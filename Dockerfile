FROM monius/docker-ai-infra:base

RUN mamba shell init -s bash

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

EXPOSE 9100