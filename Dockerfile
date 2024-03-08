FROM debian:bookworm-slim

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

EXPOSE 9100

CMD ["ls", "/usr/bin/mamba"]