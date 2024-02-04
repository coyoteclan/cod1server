#!/bin/bash

# Set default values for variables if not provided
MAX_CLIENTS=${MAX_CLIENTS:-16}
RCON_PASSWORD=${RCON_PASSWORD:-password}
NET_PORT=${NET_PORT:-28960}
FS_GAME=${FS_GAME:-main}

LD_PRELOAD="./codextended.so" ./cod_lnxded +exec myserver.cfg +set dedicated 2 +set ttycon 0 +set sv_maxclients $MAX_CLIENTS +set rcon_password $RCON_PASSWORD +set net_ip 0.0.0.0 +set net_port $NET_PORT +set sv_punkbuster 0 +set fs_basepath . +set fs_homepath . +set fs_game $FS_GAME +map_rotate
