# My own fish customization functions

function mt_customize_abbreviations -d "sets custom abbreviations; uses guard"
  # inspired by: https://github.com/fish-shell/fish-shell/issues/731#issuecomment-244457493
  if not set -q MaciekTalaskaFishConfig 
    # git
    abbr -a g git
    abbr -a ga git add
    abbr -a gp git push
    abbr -a gc git commit
    abbr -a gs git status
    abbr -a gl git ls
    abbr -a gd git diff
    abbr -a gdv git difftool --tool=vimdiff
    abbr -a gau git add -u
    abbr -a gcm git commit -m
    abbr -a gca git commit -a -m
    abbr -a gbl git branch --list
    abbr -a gsl git stash list
    abbr -a gdc git diff --cached
    # others 
    abbr -a enw emacs -nw
    abbr -a e emacs -nw
    abbr -a ec emacsclient -t
    set -U MaciekTalaskaFishConfig
  end
end


function mt_configs_backup -d "copy current (used configuraton) into ~/projects/dotfiles" 
  pushd .
  rsync -avR .config/fish/functions/ ~/projects/dotfiles/
  rsync -avR .config/fish/config.fish ~/projects/dotfiles/
  rsync -avR .config/fish/fishd.xps ~/projects/dotfiles/
  rsync -avR .config/fisherman/fishfile ~/projects/dotfiles/
  cp ~/.conkyrc ~/projects/dotfiles/.conkyrc
  cp ~/.vimrc ~/projects/dotfiles/.vimrc
  cp ~/.tmux.conf ~/projects/dotfiles/.tmux.conf
  cp ~/.bashrc ~/projects/dotfiles/.bashrc
  cp ~/.bash_profile ~/projects/dotfiles/.bash_profile
  cp ~/.bash_aliases ~/projects/dotfiles/.bash_aliases
  cp ~/.zshrc ~/projects/dotfiles/.zshrc
  popd
end

function mt_configs_apply_all -d "copy all configs from ~/projects/dotfiles into ~"
  pushd .
  cd ~
  rsync -avR ~/projects/dotfiles ~/
  __mt_remove_fishd
  popd
end

function mt_configs_apply_fish -d "copy only fish configuration from ~/project/dotfiles into ~"
  pushd .
  cd ~
  rsync -av ~/projects/dotfiles/.config/fish ~/.config
  __mt_remove_fishd
  popd
end

function __mt_remove_fishd
  rm ~/.config/fish/fishd.*
end

function __mt_erase_editor
  set EDITOR ""
end

function __mt_restore_editor
  set EDITOR $__editor  
end

function mfunced -d "same as funced, but uses only internal fish editor"
  __mt_erase_editor
  funced $argv
  __mt_restore_editor
end
