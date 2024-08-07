DESKTOP_FILE=tneilCPRT.desktop
GAME_DIR=`pwd`

# remove existing ClassiCube desktop entry file
rm $DESKTOP_FILE

# download ClassiCube icon from github if necessary
if [ -f "ynomraHIcon.png" ]
then
  echo "ynomraHIcon.png exists already. Skipping download."
else
  echo "ynomraHIcon.png doesn't exist. Attempting to download it.."
  wget "https://raw.githubusercontent.com/RandomStrangers/tneilCPRT/master/misc/icon.png"
fi

# create tneilCPRT desktop entry
echo 'Creating tneilCPRT.desktop..'
cat >> $DESKTOP_FILE << EOF
[Desktop Entry]
Type=Application
Comment=Minecraft Classic inspired sandbox game
Name=tneilCPRT
Exec=$GAME_DIR/tneilCPRT
Icon=$GAME_DIR/ynomraHIcon.png
Path=$GAME_DIR
Terminal=false
Categories=Game
EOF
chmod +x $DESKTOP_FILE

echo 'Installing tneilCPRT.desktop..'
# install tneilCPRT desktop entry into the system
sudo desktop-file-install --dir=/usr/share/applications tneilCPRT.desktop
sudo update-desktop-database /usr/share/applications
