FROM debian:latest

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    lib32z1 \
    libc6-i386 \
    wget \
    unzip \
    g++-multilib \
    libstdc++6:i386 \
    bzip2

RUN wget https://raw.githubusercontent.com/coyoteclan/cod1server/main/install.sh

WORKDIR /home/container

COPY install.sh /home/container

RUN cd /home/container && chmod +x install.sh && bash install.sh
