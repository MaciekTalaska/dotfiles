# taken from: https://gist.github.com/halicki/58cedaf90f3e85277a799cef8217fc72
function mcu
    set SHELL_PID %self
    set MC_PWD_FILE "/tmp/mc-$USER/mc.pwd.$SHELL_PID"
        
    /usr/bin/mc -P $MC_PWD_FILE $argvi -u
        
    if test -r $MC_PWD_FILE
    
        set MC_PWD (cat $MC_PWD_FILE)
        if test -n "$MC_PWD"
            and test -d "$MC_PWD"
            cd (cat $MC_PWD_FILE)
        end
        
        rm $MC_PWD_FILE
    end
end
