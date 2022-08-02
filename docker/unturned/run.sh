#!/bin/sh
mkdir -p /root/.steam/SteamApps/common/U3DS/Servers/MyServer/Server/
cp /root/Commands.dat /root/.steam/SteamApps/common/U3DS/Servers/MyServer/Server/

cd /root/.steam/SteamApps/common/U3DS/
./ServerHelper.sh +InternetServer/MyServer