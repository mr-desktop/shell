#!/bin/bash

# - environment: Cinnamon
# - version: 21
# ----------------------------

echo "Installing dependencies..."
sudo apt update && sudo apt -y install \
curl \
git \
xclip \
xsel \
wget \ 
snapd

echo "NVM / part 1"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "Yarn / part 1"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "VScode"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt update && sudo apt -y install \
vlc \
winff \
ffmpeg \
inkscape \
gimp \
trimage \
android-tools-adb \
android-tools-fastboot \
arc-theme \
papirus-icon-theme \
breeze-cursor-theme \
imagemagick \
gparted \
docker* \
python3-tk \
libimage-exiftool-perl \
yarn \
code

echo "Reset terminal to start NVM..."
exec bash -l

echo "NVM / part 2"
nvm install --lts

echo "Docker / part 2 / Adding docker persmissions for current user"
sudo usermod -aG docker ${USER}

echo "NVM / part 3 / Install global node packages"
npm i -g @vue/cli
npm i -g typescript

echo "SSH key generation"
ssh-keygen -t ed25519

echo "
Get the following packages from Software Manager:
- blender-flatpak
- unity-hub
- git kraken
- video downloader flatpack
"