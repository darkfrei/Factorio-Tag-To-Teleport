# prepare zip file
mkdir TagToTeleport_0.0.2
cp info.json TagToTeleport_0.0.2
cp README.md TagToTeleport_0.0.2
cp MIT_license.txt TagToTeleport_0.0.2
cp thumbnail.png TagToTeleport_0.0.2
cp thumbnail.pdn TagToTeleport_0.0.2
cp *.lua TagToTeleport_0.0.2
cp -R graphics TagToTeleport_0.0.2
cp -R locale TagToTeleport_0.0.2
cp changelog.txt TagToTeleport_0.0.2
zip -r TagToTeleport_0.0.2{.zip,}

# move zip to factorio mods folder (overriding existing one if present)
mv TagToTeleport_0.0.2.zip "/cygdrive/c/Users/${USER}/AppData/Roaming/Factorio/mods"

# cleanup
rm -r TagToTeleport_0.0.2
