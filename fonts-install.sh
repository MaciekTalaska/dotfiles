#! /usr/bin/env bash

# parameter is source file name
download_sourcecodepro() {
  # part of the code below is based on the following gist:
  # https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
  curl -s https://api.github.com/repos/adobe-fonts/source-code-pro/releases/latest \
  | grep "$1" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget --show-progress -qi -
  mv SourceCodeVariable*.* ~/.local/share/fonts/
}

download_all_sourcecodepro_fonts() {
  echo "Installing Adobe SourceCode Pro fonts..."
  fonts=("SourceCodeVariable-Roman.otf" "SourceCodeVariable-Italic.otf") 
  for font_name in ${fonts[@]} 
  do
    download_sourcecodepro $font_name
  done
}

# this function only installs DejaVu Sans Mono Powerline font
install_powerline_fonts() {
  echo "downloading powerline fonts"
  git clone https://github.com/powerline/fonts powerline-fonts
  cd powerline-fonts
  ./install.sh Deja
  
  cd ..
  rm powerline-fonts -rf
}

pushd . >> /dev/null
mkdir -p ~/config
cd ~/config

install_powerline_fonts
download_all_sourcecodepro_fonts

popd >> /dev/null

bash _utils.sh clean_font_cache

