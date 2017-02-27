set -g fish_prompt_pwd_dir_length 4 

set -g __mt_git_bg white 
set -g __mt_git_fg normal 
set -g __mt_prompt_git_color (set_color $__mt_git_fg -b $__mt_git_bg)

set -xU GIT_RADAR_FORMAT "%{branch}%{ :local}%{ :changes}%{remote: }%{stash}"

set -xU GIT_RADAR_COLOR_BRANCH $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_LOCAL_BEHIND $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_LOCAL_DIVERGED $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_REMOTE_AHEAD $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_REMOTE_BEHIND $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_REMOTE_DIVERGED $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_REMOTE_NOT_UPSTREAM $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_CHANGES_STAGED $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_CHANGES_UNSTAGED $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_CHANGES_CONFLICTED $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_CHANGES_UNTRACKED $__mt_prompt_git_color  
set -xU GIT_RADAR_COLOR_STASH $__mt_prompt_git_color  
set -xU GIT_RADAR_MASTER_SYMBOL $__mt_prompt_git_color

set -xU GIT_RADAR_COLOR_LOCAL_RESET $__mt_prompt_git_color 
set -xU GIT_RADAR_COLOR_REMOTE_RESET $__mt_prompt_git_color 
set -xU GIT_RADAR_COLOR_CHANGES_RESET $__mt_prompt_git_color 
set -xU GIT_RADAR_COLOR_BRANCH_RESET $__mt_prompt_git_color 
set -xU GIT_RADAR_COLOR_STASH $__mt_prompt_git_color 

set -g __mt_prompt_char_right_arrow \ue0b0
set -g __mt_prompt_char_lambda \u03bb

#function __mt_fish_prompt_bluepwd_gitradar_greenwhitelambda
#    #set_color $fish_color_cwd
#    set_color white -b blue
#    echo -n (prompt_pwd)' '
#    set_color blue -b normal 
#    echo -n $__mt_prompt_char_right_arrow
#    set_color normal 
#    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
#    set_color brwhite -b green 
#    echo -n $__mt_prompt_char_right_arrow
#    set_color -o white -b green 
#    echo -n ' '$__mt_prompt_char_lambda' '
#    set_color green -b normal
#    echo -n $__mt_prompt_char_right_arrow' '
#    set_color normal
#end

#function __mt_fish_prompt_bluepwd_gitradar_blackgreenlambda 
#    #set_color $fish_color_cwd
#    set_color white -b blue
#    echo -n (prompt_pwd)' '
#    set_color blue -b normal 
#    echo -n $__mt_prompt_char_right_arrow
#    set_color normal 
#    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
#    set_color brwhite -b brblack
#    echo -n $__mt_prompt_char_right_arrow
#    set_color green -b brblack 
#    echo -n ' '$__mt_prompt_char_lambda' '
#    set_color brblack -b normal
#    echo -n $__mt_prompt_char_right_arrow' '
#    set_color normal
#end

#function __mt_fish_prompt_blue_thinarrowending
#    #set_color $fish_color_cwd
#    set_color -o white -b blue
#    echo -n (prompt_pwd)' '
#    set_color blue -b normal 
#    echo -n $__mt_prompt_char_right_arrow
#    set_color normal 
#    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
#    set_color brwhite -b normal 
#    echo -n \u276f
#    set_color -o blue -b normal 
#    echo -n ' '$__mt_prompt_char_lambda' '
#    set_color blue -b normal
#    echo -n \u276f' '
#    set_color normal
#end

#function __mt_fish_prompt_fatblue
#    #set_color $fish_color_cwd
#    set_color -o white -b blue
#    echo -n (prompt_pwd)' '
#    set_color blue -b normal 
#    echo -n $__mt_prompt_char_right_arrow
#    set_color normal 
#    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
#    set_color brwhite -b blue
#    echo -n $__mt_prompt_char_right_arrow
#    set_color -o white -b blue 
#    echo -n ' '$__mt_prompt_char_lambda' '
#    set_color blue -b normal
#    echo -n $__mt_prompt_char_right_arrow' '
#    set_color normal
#end


# -=[ all functions above should be removed ]=-
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
    set -g __mt_prompt_git_fg brwhite
    set -g __mt_prompt_git_bg brblack
    set -g __mt_prompt_lambda_fg green

    __mt_fish_prompt_generic_fatending
end

function __mt_fish_prompt_generic_fatending
    set_color $__mt_prompt_pwd_fg -b $__mt_prompt_pwd_bg
    echo -n (prompt_pwd)' '
#set_color $__mt_prompt_pwd_bg -b normal 
    set_color $__mt_prompt_pwd_bg -b $__mt_git_bg 
    echo -n $__mt_prompt_char_right_arrow
#set_color normal 
    echo -n ' '(~/configuration/git-radar/git-radar --fish --fetch)' '
    set_color $__mt_git_bg -b $__mt_prompt_git_bg 
    echo -n $__mt_prompt_char_right_arrow
    set_color $__mt_prompt_lambda_fg -b $__mt_prompt_git_bg
    echo -n ' '$__mt_prompt_char_lambda' '
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
    set_color $__mt_prompt_pwd_fg -b $__mt_prompt_pwd_bg
    echo -n (prompt_pwd)' '
    set_color $__mt_prompt_pwd_bg -b normal 
    echo -n $__mt_prompt_char_right_arrow
#    set_color normal 
    echo -n (~/configuration/git-radar/git-radar --fish --fetch --no-space)' '
    set_color $__mt_prompt_git_fg -b normal
    echo -n \u276f
    set_color -o blue -b normal 
    echo -n ' '$__mt_prompt_char_lambda' '
    set_color blue -b normal
    echo -n \u276f' '
    set_color normal
end
