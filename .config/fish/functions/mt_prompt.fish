set -g fish_prompt_pwd_dir_length 4 

set -g __mt_git_bg brwhite 
set -g __mt_git_fg normal 
set -g __mt_prompt_git_color (set_color $__mt_git_fg -b $__mt_git_bg)

set -g __mt_prompt_char_right_arrow \ue0b0
set -g __mt_prompt_char_lambda \u03bb
set -g __mt_prompt_char_arrow \u22b3
set -g __mt_prompt_char_arrow2 \u1405
set -g __mt_prompt_ending $__mt_prompt_char_lambda

#set -g __mt_prompt_multiline 0 

function __mt_prompt_clear_git_radar_customizations
  set -e GIT_RADAR_FORMAT 

  set -e GIT_RADAR_COLOR_BRANCH 
  set -e GIT_RADAR_COLOR_LOCAL_BEHIND 
  set -e GIT_RADAR_COLOR_LOCAL_DIVERGED 
  set -e GIT_RADAR_COLOR_REMOTE_AHEAD 
  set -e GIT_RADAR_COLOR_REMOTE_BEHIND 
  set -e GIT_RADAR_COLOR_REMOTE_DIVERGED 
  set -e GIT_RADAR_COLOR_REMOTE_NOT_UPSTREAM 
  set -e GIT_RADAR_COLOR_CHANGES_STAGED 
  set -e GIT_RADAR_COLOR_CHANGES_UNSTAGED 
  set -e GIT_RADAR_COLOR_CHANGES_CONFLICTED 
  set -e GIT_RADAR_COLOR_CHANGES_UNTRACKED 
  set -e GIT_RADAR_COLOR_STASH 
  set -e GIT_RADAR_MASTER_SYMBOL 

  set -e GIT_RADAR_COLOR_LOCAL_RESET 
  set -e GIT_RADAR_COLOR_REMOTE_RESET 
  set -e GIT_RADAR_COLOR_CHANGES_RESET 
  set -e GIT_RADAR_COLOR_BRANCH_RESET 
  set -e GIT_RADAR_COLOR_STASH 
end

function __mt_prompt_customize_git_radar
  if not test -n "$GIT_RADAR_FORMAT"

    #set -xU GIT_RADAR_FORMAT "%{branch: }%{local: }%{remote: }%{changes: }%{stash: }"
    set -xU GIT_RADAR_FORMAT "%{remote: }%{branch: }%{local: }%{changes: }%{stash: }"
#    set -xU GIT_RADAR_COLOR_BRANCH $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_LOCAL_BEHIND $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_LOCAL_DIVERGED $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_REMOTE_AHEAD $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_REMOTE_BEHIND $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_REMOTE_DIVERGED $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_REMOTE_NOT_UPSTREAM $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_CHANGES_STAGED $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_CHANGES_UNSTAGED $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_CHANGES_CONFLICTED $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_CHANGES_UNTRACKED $__mt_prompt_git_color  
#    set -xU GIT_RADAR_COLOR_STASH $__mt_prompt_git_color  
#    set -xU GIT_RADAR_MASTER_SYMBOL $__mt_prompt_git_color
#
#    set -xU GIT_RADAR_COLOR_LOCAL_RESET $__mt_prompt_git_color 
    set -xU GIT_RADAR_COLOR_REMOTE_RESET $__mt_prompt_git_color 
#    set -xU GIT_RADAR_COLOR_CHANGES_RESET $__mt_prompt_git_color 
#    set -xU GIT_RADAR_COLOR_BRANCH_RESET $__mt_prompt_git_color 
#    set -xU GIT_RADAR_COLOR_STASH $__mt_prompt_git_color 
  end
end

function mt_prompt_multi
  set -xU __mt_prompt_multiline 1
end

function mt_prompt_single
  set -e __mt_prompt_multiline
end

function __mt_fish_prompt_whitebluepwd_whitegreenlambda
    set -g __mt_prompt_pwd_fg white
    set -g __mt_prompt_pwd_bg blue
    set -g __mt_prompt_git_fg white
    set -g __mt_prompt_git_bg green 
    set -g __mt_prompt_lambda_fg white 

    __mt_fish_prompt_generic_fatending
end

function __mt_fish_prompt_whitebluepwd_whitebluelambda
    set -g __mt_prompt_pwd_fg white
    set -g __mt_prompt_pwd_bg blue
    set -g __mt_prompt_git_fg brwhite
    set -g __mt_prompt_git_bg blue
    set -g __mt_prompt_lambda_fg white 

    __mt_fish_prompt_generic_fatending
end

function __mt_fish_prompt_whitebluepwd_greenblacklambda
    set -g __mt_prompt_pwd_fg white
    set -g __mt_prompt_pwd_bg blue
    set -g __mt_prompt_git_fg normal
    set -g __mt_prompt_git_bg black 
    set -g __mt_prompt_lambda_fg green

    __mt_fish_prompt_generic_fatending
end

function __mt_fish_prompt_solarized
    set -g __mt_prompt_pwd_fg normal
    set -g __mt_prompt_pwd_bg eee8d5
    set -g __mt_prompt_git_fg normal
    set -g __mt_prompt_git_bg eee8d5 
    set -g __mt_prompt_lambda_fg green

    __mt_fish_prompt_generic_fatending
end

function __mt_fish_prompt_generic_fatending
  __mt_prompt_customize_git_radar

    set_color $__mt_prompt_pwd_fg -b $__mt_prompt_pwd_bg
    echo -n (prompt_pwd)' '
    set_color $__mt_prompt_pwd_bg -b $__mt_git_bg 
    echo -n $__mt_prompt_char_right_arrow
    echo -n ' '(~/configuration/git-radar/git-radar --fish --fetch)' '
    
    if test -n "$__mt_prompt_multiline" 
      set_color $__mt_git_bg -b normal 
      echo -n $__mt_prompt_char_right_arrow
      echo
      set_color $__mt_git_bg -b $__mt_prompt_git_bg 
      echo -n ' '
#      set_color $__mt_prompt_lambda_fg -b $__mt_prompt_git_bg
#      echo -n ' '$__mt_prompt_ending' '
#      set_color $__mt_prompt_git_bg -b normal
#      echo -n $__mt_prompt_char_right_arrow' '
#      set_color normal
    else
      set_color $__mt_git_bg -b $__mt_prompt_git_bg 
      echo -n $__mt_prompt_char_right_arrow
#      set_color $__mt_prompt_lambda_fg -b $__mt_prompt_git_bg
#      echo -n ' '$__mt_prompt_ending' '
#      set_color $__mt_prompt_git_bg -b normal
#      echo -n $__mt_prompt_char_right_arrow' '
#      set_color normal
    end
    set_color $__mt_prompt_lambda_fg -b $__mt_prompt_git_bg
    echo -n ' '$__mt_prompt_ending' '
    set_color $__mt_prompt_git_bg -b normal
    echo -n $__mt_prompt_char_right_arrow' '
    set_color normal
end

function __mt_fish_prompt_whitebluepwd_thinending
    set -g __mt_prompt_pwd_fg white
    set -g __mt_prompt_pwd_bg blue
    set -g __mt_prompt_git_fg brwhite
    set -g __mt_prompt_git_bg brblack
    set -g __mt_prompt_lambda_fg green

    __mt_fish_prompt_generic_thinending
end

function __mt_fish_prompt_generic_thinending
  __mt_prompt_customize_git_radar

    set_color $__mt_prompt_pwd_fg -b $__mt_prompt_pwd_bg
    echo -n (prompt_pwd)' '
    set_color $__mt_prompt_pwd_bg -b $__mt_git_bg 
    echo -n $__mt_prompt_char_right_arrow
    echo -n (~/configuration/git-radar/git-radar --fish --fetch --no-space)' '
    if test -n "$__mt_prompt_multiline" 
      echo
    end
    set_color $__mt_git_bg -b $__mt_prompt_git_fg 
    echo -n $__mt_prompt_char_right_arrow
    set_color -o blue -b normal 
    echo -n ' '$__mt_prompt_char_lambda' '
    set_color blue -b normal
    echo -n \u276f' '
    set_color normal
end

function __mt_simple_prompt
  set -g __mt_git_bg normal 
  set -g __mt_git_fg normal 
  set -g __mt_prompt_git_color (set_color $__mt_git_fg -b $__mt_git_bg)
  #__mt_prompt_clear_git_radar_customizations

  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n ' '(~/configuration/git-radar/git-radar --fish --fetch)
  if test -n "$__mt_prompt_multiline" 
    echo
  end
  set_color normal
  echo '' $__mt_prompt_char_lambda ''
end

function __mt_simple
  set -g __mt_git_bg normal 
  set -g __mt_git_fg normal 
  set -g __mt_prompt_git_color (set_color $__mt_git_fg -b $__mt_git_bg)
  #__mt_prompt_clear_git_radar_customizations

  set_color blue
  echo -n (prompt_pwd)
  set_color normal
  echo -n ' '(~/configuration/git-radar/git-radar --fish --fetch)
  set_color blue 
  echo $__mt_prompt_char_lambda
end
