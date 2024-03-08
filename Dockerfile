FROM debian:bookworm-slim

ENV PKG="curl git bzip2"

RUN apt-get -qq update \
    && apt-get -qq install $PKG \
    && apt-get -qq autoremove --purge && apt-get clean

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

EXPOSE 9100

CMD ["micromamba", "run", "-n", "aii", "python" , "/opt/demo.py"]