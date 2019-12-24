set fish_greeting ''
set -xg SHELL /usr/bin/fish
set -x LANG en_US.UTF-8
set __editor vim
set -Ux EDITOR $__editor 
set -Ux VISUAL $__editor

source $HOME/.config/fish/functions/mt_prompt.fish

function fish_prompt
#    ~/configuration/powerline-shell/powerline-shell.py $status --shell bare ^/dev/null --colorize-hostname --cwd-mode plain
  # __mt_simple  
  __mt_fish_prompt_whitebluepwd_greenblacklambda
end

source $HOME/.config/fish/functions/mt_tools.fish
mt_customize_abbreviations

# opam configuration
source /home/maciek/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# asdf
source ~/.asdf/asdf.fish

# fnm
set PATH /home/maciek/.fnm $PATH
fnm env --multi | source
