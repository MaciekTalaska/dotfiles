set fish_greeting ''
set -x LANG en_US.UTF-8

function fish_prompt
    ~/configuration/powerline-shell/powerline-shell.py $status --shell bare ^/dev/null --colorize-hostname --cwd-mode plain
end

source $HOME/.config/fish/functions/mt_tools.fish
mt_customize_abbreviations

source ~/.asdf/asdf.fish

set __editor vim
set -Ux EDITOR $__editor 
set -Ux VISUAL $__editor

#set -gx GOROOT_BOOTSTRAP "/home/emgieha/.gvm/gos/go1.7.4"
#set -gx GOPATH ~/projects/go-projects
#set PATH $GOPATH/bin $PATH 
