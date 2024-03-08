FROM debian:bookworm-slim

ENV PKG="curl git"

RUN apt-get -qq update \
    && apt-get -qq install --no-install-recommends $PKG \
    && apt-get -qq autoremove --purge && apt-get clean

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

EXPOSE 9100

CMD ["ls", "/usr/bin/mamba"]