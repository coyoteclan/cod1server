#!/bin/bash

# Download and extract base files if not already present
if [ ! -d "main" ]; then
    wget -O basefiles.zip https://de.dvotx.org/dump/cod1/downloads.php?get=basefiles && \
    wget -O language_en.zip https://de.dvotx.org/dump/cod1/downloads.php?get=english && \
    unzip basefiles.zip -d main && \
    unzip language_en.zip -d main && \
    rm language_en.zip && \
    rm basefiles.zip
fi

# Download and extract Call of Duty server files if not already present
if [ ! -d "cod_lnxded-1.1d" ]; then
    wget -O cod_lnxded-1.1d.tar.bz2 https://de.dvotx.org/dump/cod1/cod-lnxded-1.1d.tar.bz2 && \
    tar -xjf cod_lnxded-1.1d.tar.bz2 && \
    rm cod_lnxded-1.1d.tar.bz2
fi

# Download myserver.cfg if not already present
if [ ! -d "main" ]; then
    wget -O https://de.dvotx.org/dump/cod1/myserver.cfg && \
    cp ./myserver.cfg ./main && \
    rm ./myserver.cfg
fi

# Download codextended.so if not already present
if [ ! -f "codextended.so" ]; then
    wget -O codextended.so https://github.com/xtnded/codextended/releases/download/v20/codextended.so
fi

# Set execute permissions for Call of Duty server binary
chmod +x cod_lnxded
