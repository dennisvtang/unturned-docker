#!/bin/bash
SCRIPT_DIR=$PWD
curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz

# Update / install server
./steamcmd.sh +login $STEAM_USERNAME $STEAM_PASSWORD $STEAM_GUARD_TOKEN $STEAM_CMD_ARGS +force_install_dir $GAME_INSTALL_DIR +@sSteamCmdForcePlatformBitness 64 +app_update $GAME_ID +quit

# Move the steamclient
mkdir -p /home/steam/.steam/sdk64/
cp -f linux64/steamclient.so /home/steam/.steam/sdk64/steamclient.so

# Start game
cd $SCRIPT_DIR
./start_gameserver.sh "$@"
