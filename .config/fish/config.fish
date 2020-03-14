set fish_greeting ''
set -xg SHELL /usr/bin/fish
set -x LANG en_US.UTF-8
set __editor vim
set -Ux EDITOR $__editor 
set -Ux VISUAL $__editor

source $HOME/.config/fish/functions/mt_prompt.fish

function fish_prompt
  #__mt_simple  
  #__mt_simple_prompt
  __mt_fish_prompt_whitebluepwd_greenblacklambda
end

source $HOME/.config/fish/functions/mt_tools.fish
mt_customize_abbreviations

# opam configuration
# if line below s commented out: type 'eval (opam env)'
# this makes binaries located in ~/.opam/default/bin part of path
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# asdf
source ~/.asdf/asdf.fish

# fnm
set PATH $HOME/.fnm $PATH
fnm env --multi | source
