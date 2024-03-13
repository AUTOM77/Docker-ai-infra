FROM monius/docker-ai-infra:base

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

EXPOSE 9100

CMD ["mamba", "run", "hypercorn", "/opt/run/app:app", "--bind", "unix:/dev/shm/aii.sock"]