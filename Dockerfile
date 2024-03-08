FROM monius/docker-ai-infra:base
COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

EXPOSE 9100

CMD ["/bin/bash"]