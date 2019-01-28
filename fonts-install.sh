#! /usr/bin/env bash

pushd pwd
mkdir -p ~/config
cd ~/config

echo "downloading powerline fonts"
git clone https://github.com/powerline/fonts powerline-fonts
cd powerline-fonts
./install.sh Deja

cd ..
rm powerline-fonts -rf

# part of the script below is based on the following gist:
# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8

echo "installing SourceCodePro (book)"
curl -s https://api.github.com/repos/adobe-fonts/source-code-pro/releases/latest \
| grep "SourceCodeVariable-Roman.otf" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -


echo "installing SourceCodePro (italic)"
curl -s https://api.github.com/repos/adobe-fonts/source-code-pro/releases/latest \
| grep "SourceCodeVariable-Italic.otf" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

mv SourceCodeVariable*.* ~/.local/share/fonts/

popd
