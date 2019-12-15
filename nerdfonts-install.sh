#! /usr/bin/env bash

# output name, link
download_font() {
  wget -q --show-progress -O $1 $2
}

pushd .
mkdir -p ~/config/nerdfonts
cd ~/config/nerdfonts

# Fira Code, DejaVu Sans Mono, Hasklung (Haskling), Hack, Iosevka, Mononoki, Sauce Code (Source Code Pro),  
echo "installing nerdfonts..."

download_font dejavusansmono_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
#download_font dejavusansmono_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf?raw=true

#download_font firaccode_regular_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
download_font firacode_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf?raw=true

download_font hack_regular_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true 
#download_font hack_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf?raw=true 

#download_font hasklung_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hasklig/Regular/complete/Hasklug%20Nerd%20Font%20Complete%20Mono.otf?raw=true
download_font hasklung_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hasklig/Regular/complete/Hasklug%20Nerd%20Font%20Complete.otf?raw=true

download_font iosevka_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
#download_font iosevka_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete.ttf?raw=true

download_font mononoki_regular_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
#download_font mononoki_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete.ttf?raw=true 

#download_font sauce_code_pro_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
download_font suace_code_pro_nerd_font_complete.ttf      https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true

cd ..
mv nerdfonts ~/.local/share/fonts/

popd >> /dev/null

# clean font cache
echo "clean font cache..."
fc-cache -fv >> /dev/null
