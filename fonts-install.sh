pushd
mkdir ~/config
cd ~/config

git clone https://github.com/powerline/fonts powerline-fonts
cd powerline-fonts
./install deja

cd ..
rm powerline-fonts -rf

