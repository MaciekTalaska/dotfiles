#! /usr/bin/env bash

# this script installs the following nerd fonts:
# Fira Code, DejaVu Sans Mono, Hasklung (Haskling), Hack, Iosevka, Mononoki, Sauce Code (Source Code Pro),  


# output name, link
download_font() {
  wget -q --show-progress -O $1 $2
}

download_all_fonts() {
  download_font dejavusansmono_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf?raw=true

  download_font firacode_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf?raw=true

  download_font hack_regular_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true 

  download_font hasklung_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hasklig/Regular/complete/Hasklug%20Nerd%20Font%20Complete.otf?raw=true

  download_font iosevka_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete%20Mono.ttf?raw=true

  download_font mononoki_regular_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true

  download_font suace_code_pro_nerd_font_complete.ttf      https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true

}

clean_font_cache() {
  echo "clean font cache..."
  fc-cache -fv >> /dev/null
}

uninstall() {
  rm ~/.local/share/fonts/nerdfonts -rd
  clean_font_cache
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

