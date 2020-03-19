export SHELL=/usr/bin/zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt prompt_subst
export GIT_RADAR_FORMAT="%{remote: }%{branch: }%{local: }%{changes: }%{stash: }" 
export PROMPT="%F{green}%2~%F{normal} \$(git-radar --zsh --no-space)> "

# load plugins
# plugins should be generated using antibody:
# antibody bundle < .zsh_plugins > .zsh_plugins.sh
source ~/.zsh_plugins.sh

abbrev-alias -g la="ls -laXh" 
abbrev-alias -g g="git"
abbrev-alias -g ga="git add"
abbrev-alias -g gp="git push"
abbrev-alias -g gc="git commit"
abbrev-alias -g gs="git status"
abbrev-alias -g gl="git ls"
abbrev-alias -g gd="git diff"
abbrev-alias -g gdv="git difftool --tool=vimdiff"
abbrev-alias -g gau="git add -u"
abbrev-alias -g gcm="git commit -m"
abbrev-alias -g gca="git commit -a -m"
abbrev-alias -g gbl="git branch --list"
abbrev-alias -g gsl="git stash list"
abbrev-alias -g gdc="git diff --cached"

export PATH=$HOME/.fnm:$PATH
export PATH=$HOME/.asdf/shims:$PATH
export PATH=$HOME/.asdf/bin:$PATH

source /home/emgieha/.asdf/asdf.sh
