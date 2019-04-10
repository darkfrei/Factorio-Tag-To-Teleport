# prepare zip file
mkdir TagToTeleport_1.0.1
cp info.json TagToTeleport_1.0.1
cp README.md TagToTeleport_1.0.1
cp LICENSE TagToTeleport_1.0.1
cp thumbnail.png TagToTeleport_1.0.1
cp thumbnail.pdn TagToTeleport_1.0.1
cp *.lua TagToTeleport_1.0.1
cp -R graphics TagToTeleport_1.0.1
cp -R locale TagToTeleport_1.0.1
cp changelog.txt TagToTeleport_1.0.1
zip -r TagToTeleport_1.0.1{.zip,}

# move zip to factorio mods folder (overriding existing one if present)
mv TagToTeleport_1.0.1.zip "/cygdrive/c/Users/${USER}/AppData/Roaming/Factorio/mods"

# cleanup
rm -r TagToTeleport_1.0.1
