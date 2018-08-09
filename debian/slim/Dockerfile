FROM debian:stretch-slim

LABEL maintainer.name="Anthony PERIQUET"
LABEL maintainer.email="anthony@periquet.net"
LABEL description="A compatibility layer for running Windows programs"

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y --no-install-recommends \
        alsa-utils \
        ca-certificates \
        libgl1-mesa-dri \
        libgl1-mesa-glx \
        xdg-utils \
        wine \
        wine32 \
        winbind && \
    rm -rf /var/lib/apt/lists/*

ENV HOME /home/wine
RUN useradd --create-home --home-dir $HOME wine \
    && gpasswd -a wine wine \
    && chown -R wine:wine $HOME

WORKDIR $HOME
USER    wine

ENTRYPOINT [ "wine" ]