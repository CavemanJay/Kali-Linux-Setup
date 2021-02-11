gh=https://github.com/CavemanJay
baseDir=$HOME/repos
root=$(pwd)

# Install dependencies
sudo apt install -y xorg-dev xcb libxcb-xkb-dev x11-xkb-utils libx11-xcb-dev libxkbcommon-x11-dev libxcb-res0-dev picom cmake

mkdir -p $baseDir
git clone $gh/dwm.git $baseDir/dwm
git clone $gh/st.git $baseDir/st
git clone $gh/dmenu.git $baseDir/dmenu
git clone https://github.com/enkore/j4-dmenu-desktop.git $baseDir/j4dmenu

# Install dwm and st
cd $baseDir/dwm && sudo make clean install
cd $baseDir/st && sudo make clean install
cd $baseDir/j4dmenu && cmake . && make && sudo make install

# Dwm xsession setup
echo "W0Rlc2t0b3AgRW50cnldClZlcnNpb249MS4wCk5hbWU9RHdtIFNlc3Npb24KRXhlYz1kd20KSWNvbj0KVHlwZT1BcHBsaWNhdGlvbgpEZXNrdG9wTmFtZXM9RFdNCg==" | base64 -d | sudo tee /usr/share/xsessions/dwm.desktop

# Picom setup
mkdir -p $HOME/.config/picom
cp $root/picom.conf $HOME/.config/picom

# Dwm autostart setup
mkdir -p $HOME/.dwm
cp $root/dwm_autostart.sh $HOME/.dwm/autostart.sh

# Fonts setup
git clone https://github.com/ryanoasis/nerd-fonts --depth 1 $baseDir/nerdfonts
cd $baseDir/nerdfonts

./install.sh FiraCode
./install.sh Mononoki

# vscode setup
cd /tmp
wget -v -O vscode.deb "https://code.visualstudio.com/sha/download?build=insider&os=linux-deb-x64" && \
sudo apt install ./vscode.deb