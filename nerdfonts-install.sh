#! /usr/bin/env bash

# this script installs the following nerd fonts:
# Fira Code, DejaVu Sans Mono, Hack, auce Code (Source Code Pro)


# output name, link
download_font() {
  wget -q --show-progress -O $1 $2
}

download_all_fonts() {
  # this is assoctiative array in bash
  # key is the name of the file font will be stored in
  # and the value is the download link
  declare -A fonts
  fonts[dejavusansmono_nerd_font_complete_mono.ttf]="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf?raw=true"
  fonts[firacode_regular_nerd_font_complete.ttf]="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf?raw=true"
  fonts[hack_regular_nerd_font_complete_mono.ttf]="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true"
  # fonts[hasklung_nerd_font_complete.ttf]="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hasklig/Regular/complete/Hasklug%20Nerd%20Font%20Complete.otf?raw=true"
  # fonts[iosevka_nerd_font_complete_mono.ttf]="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete%20Mono.ttf?raw=true"
  # fonts[mononoki_regular_nerd_font_complete_mono.ttf]="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true"
  fonts[sauce_code_pro_nerd_font_complete.ttf]="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true"

  for f in "${!fonts[@]}"; do
    download_font "$f" "${fonts[$f]}"
  done
}

clean_font_cache() {
  echo "clean font cache..."
  fc-cache -fv >> /dev/null
}

uninstall() {
  if [[ -d "$HOME/.local/share/fonts/nerdfonts" ]]
  then
    echo "uninstalling nerdfonts..."
    rm ~/.local/share/fonts/nerdfonts -rd
    clean_font_cache
  else
    echo "nerdfonts not present. nothing to do."
  fi
}

install() {
  pushd .
  mkdir -p ~/config/nerdfonts
  cd ~/config/nerdfonts

  echo "installing nerdfonts..."
  download_all_fonts

  cd ..
  mv nerdfonts ~/.local/share/fonts/
  popd >> /dev/null

  clean_font_cache
}



if [ "$1" = "uninstall" ] ; then
    uninstall 
else
    install 
fi

