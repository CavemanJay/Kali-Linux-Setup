gh=https://github.com/CavemanJay
baseDir=$HOME/repos

# Install dependencies
sudo apt install -y xorg-dev xcb libxcb-xkb-dev x11-xkb-utils libx11-xcb-dev libxkbcommon-x11-dev libxcb-res0-dev picom

mkdir -p $baseDir
git clone $gh/dwm.git $baseDir/dwm
git clone $gh/st.git $baseDir/st

# Install dwm and st
cd $baseDir/dwm && sudo make clean install
cd $baseDir/st && sudo make clean install

echo "W0Rlc2t0b3AgRW50cnldClZlcnNpb249MS4wCk5hbWU9RHdtIFNlc3Npb24KRXhlYz1kd20KSWNvbj0KVHlwZT1BcHBsaWNhdGlvbgpEZXNrdG9wTmFtZXM9RFdNCg==" | base64 -d | sudo tee /usr/share/xsessions/dwm.desktop


mkdir -p $HOME/.config/picom
cp ./picom.conf $HOME/.config/picom