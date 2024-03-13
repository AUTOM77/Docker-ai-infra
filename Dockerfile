FROM monius/docker-ai-infra:base

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["mamba", "run", "hypercorn", "/opt/run/app:app", "--bind", "unix:/dev/shm/aii.sock"]