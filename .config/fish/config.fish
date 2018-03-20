set fish_greeting ''
set -x LANG en_US.UTF-8

source $HOME/.config/fish/functions/mt_prompt.fish

function fish_prompt
#    ~/configuration/powerline-shell/powerline-shell.py $status --shell bare ^/dev/null --colorize-hostname --cwd-mode plain
  __mt_simple  
end

source $HOME/.config/fish/functions/mt_tools.fish
mt_customize_abbreviations

#source ~/.asdf/asdf.fish

set __editor vim
set -Ux EDITOR $__editor 
set -Ux VISUAL $__editor
