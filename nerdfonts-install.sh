#! /usr/bin/env bash

pushd .
mkdir -p ~/config/nerdfonts
cd ~/config/nerdfonts

# Fira Code, DejaVu Sans Mono, Hasklung (Haskling), Hack, Iosevka, Mononoki, Sauce Code (Source Code Pro),  
echo "installing nerdfonts..."

echo "* DejaVu Sans Mono"
wget -q --show-progress -O dejavusansmono_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
#wget -q --show-progress -O dejavusansmono_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf?raw=true

echo "* FiraCode"
#wget -q --show-progress -O firaccode_regular_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
wget -q --show-progress -O firacode_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf?raw=true

echo "* Hack"
wget -q --show-progress -O hack_regular_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true 
#wget -q --show-progress -O hack_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf?raw=true 

echo "* Hasklung (Haskling)"
#wget -q --show-progress -O hasklung_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hasklig/Regular/complete/Hasklug%20Nerd%20Font%20Complete%20Mono.otf?raw=true
wget -q --show-progress -O hasklung_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hasklig/Regular/complete/Hasklug%20Nerd%20Font%20Complete.otf?raw=true

echo "* Iosevka"
wget -q --show-progress -O iosevka_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
#wget -q --show-progress -O iosevka_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete.ttf?raw=true

echo "* Mononoki"
wget -q --show-progress -O mononoki_regular_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
#wget -q --show-progress -O mononoki_regular_nerd_font_complete.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete.ttf?raw=true 

echo "* Sauce Code (Source Code)"
#wget -q --show-progress -O sauce_code_pro_nerd_font_complete_mono.ttf https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
wget -q --show-progress -O suace_code_pro_nerd_font_complete.ttf      https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true

cd ..
mv nerdfonts ~/.local/share/fonts/

popd >> /dev/null

# clean font cache
echo "clean font cache..."
fc-cache -fv >> /dev/null
