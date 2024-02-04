FROM ubuntu:latest

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    lib32z1 \
    libc6-i386 \
    wget \
    unzip \
    bzip2

RUN chmod +x start.sh

WORKDIR /home/container

COPY install.sh .
RUN chmod +x install.sh
#COPY ./main /home/container/main
#COPY ./cod_lnxded-1.1d /home/container/cod_lnxded-1.1d
#COPY ./codextended.so /home/container

ENV LD_LIBRARY_PATH="."
ENV LD_PRELOAD="./codextended.so"

CMD ["./cod_lnxded", "+exec", "ServerConf.cfg", "+set", "dedicated", "2", "+set", "ttycon", "0", "+set", "sv_maxclients", "{MAX_CLIENTS}", "+set", "rcon_password", "{RCON_PASSWORD}", "+set", "net_ip", "0.0.0.0", "+set", "net_port", "{NET_PORT}", "+set", "sv_punkbuster", "0", "+set", "fs_basepath", ".", "+set", "fs_homepath", ".", "+set", "fs_game", "{FS_GAME}", "+map_rotate"]
