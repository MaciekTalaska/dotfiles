set -x LANG en_US.UTF-8

function fish_prompt
    ~/configuration/powerline-shell/powerline-shell.py $status --shell bare ^/dev/null
end

# source ~/.nvm-fish/nvm.fish
source ~/.kiex/scripts/kiex.fish

set fish_greeting ''

#set -Ux EDITOR vim
#set -Ux VISUAL vim
#set -g -x PATH $PATH /opt/monodevelop/bin
set -g -x PATH $PATH ~/apps/links
#gvm use go1.5.3
#set -gx GOPATH ~/projects/go-projects
#set PATH $GOPATH/bin $PATH 
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# configuration for bobthefish theme
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_vagrant no 
set -g theme_display_hg no 
set -g theme_display_virtualenv no
set -g theme_display_ruby yes
set -g theme_display_user no 
set -g theme_display_vi yes
set -g theme_display_vi_hide_mode default
set -g theme_title_display_process no 
set -g theme_title_display_path no 
set -g theme_title_use_abbreviated_path yes
#set -g theme_date_format `` 
set -g theme_avoid_ambiguous_glyphs no 
set -g theme_nerd_fonts yes 
set -g theme_show_exit_status yes
set -g default_user emgieha 
