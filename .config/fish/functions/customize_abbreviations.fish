function customize_abbreviations
  # inspired by: https://github.com/fish-shell/fish-shell/issues/731#issuecomment-244457493
  if not set -q MaciekTalaskaFishConfig 
    # git
    abbr -a ga git add
    abbr -a gp git push
    abbr -a gc git commit
    abbr -a gs git status
    abbr -a gl git ls
    abbr -a gd git diff
    abbr -a gau git add -u
    abbr -a gcm git commit -m
    abbr -a gca git commit -a -m
    abbr -a gbl git branch --list
    abbr -a gsl git stash list
    abbr -a gdc git diff --cached
    # others 
    abbr -a enw emacs -nw
    set -U MaciekTalaskaFishConfig
  end
end
