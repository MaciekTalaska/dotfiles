set -g fish_prompt_pwd_dir_length 0 
set -x GIT_RADAR_FORMAT ' %{branch} %{local} %{changes} '

function __mt_fish_prompt_bluepwd_gitradar_greenwhitelambda
    #set_color $fish_color_cwd
    set_color white -b blue
    echo -n (prompt_pwd)' '
    set_color blue -b normal 
    echo -n \ue0b0
    set_color normal 
    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
    set_color brwhite -b green 
    echo -n \ue0b0
    set_color -o white -b green 
    echo -n ' '\u03bb' '
    set_color green -b normal
    echo -n \ue0b0' '
    set_color normal
end

function __mt_fish_prompt_bluepwd_gitradar_blackgreenlambda 
    #set_color $fish_color_cwd
    set_color white -b blue
    echo -n (prompt_pwd)' '
    set_color blue -b normal 
    echo -n \ue0b0
    set_color normal 
    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
    set_color brwhite -b brblack
    echo -n \ue0b0
    set_color green -b brblack 
    echo -n ' '\u03bb' '
    set_color brblack -b normal
    echo -n \ue0b0' '
    set_color normal
end

function __mt_fish_prompt_blue_thinarrowending
    #set_color $fish_color_cwd
    set_color -o white -b blue
    echo -n (prompt_pwd)' '
    set_color blue -b normal 
    echo -n \ue0b0
    set_color normal 
    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
    set_color brwhite -b normal 
    echo -n \u276f
    set_color -o blue -b normal 
    echo -n ' '\u03bb' '
    set_color blue -b normal
    echo -n \u276f' '
    set_color normal
end

function __mt_fish_prompt_fatblue
    #set_color $fish_color_cwd
    set_color -o white -b blue
    echo -n (prompt_pwd)' '
    set_color blue -b normal 
    echo -n \ue0b0
    set_color normal 
    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
    set_color brwhite -b blue
    echo -n \ue0b0
    set_color -o white -b blue 
    echo -n ' '\u03bb' '
    set_color blue -b normal
    echo -n \ue0b0' '
    set_color normal
end

# -=[ all functions above should be removed ]=-
function __mt_fish_prompt_whitebluepwd_whitegreenlambda
    set -g __mt_prompt_pwd_fg white
    set -g __mt_prompt_pwd_bg blue
    set -g __mt_prompt_git_fg brwhite
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
    set_color $__mt_prompt_pwd_bg -b normal 
    echo -n \ue0b0
    set_color normal 
    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
    set_color $__mt_prompt_git_fg -b $__mt_prompt_git_bg
    echo -n \ue0b0
    set_color $__mt_prompt_lambda_fg -b $__mt_prompt_git_bg
    echo -n ' '\u03bb' '
    set_color $__mt_prompt_git_bg -b normal
    echo -n \ue0b0' '
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
    echo -n \ue0b0
    set_color normal 
    echo -n (~/configuration/git-radar/git-radar --fish --fetch)' '
    set_color $__mt_prompt_git_fg -b normal
    echo -n \u276f
    set_color -o blue -b normal 
    echo -n ' '\u03bb' '
    set_color blue -b normal
    echo -n \u276f' '
    set_color normal
end



function fish_prompt
  #__mt_fish_prompt_fatblue
  #__mt_fish_prompt_whitebluepwd_greenblacklambda
#  __mt_fish_prompt_whitebluepwd_whitebluelambda
#  __mt_fish_prompt_whitebluepwd_greenblacklambda
#__mt_fish_prompt_whitebluepwd_whitegreenlambda
__mt_fish_prompt_whitebluepwd_thinending
end

