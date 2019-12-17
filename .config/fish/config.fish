function fish_user_key_bindings
    bind --key nul complete-and-search
    bind \b backward-kill-word
    bind \e\[3\;5~ kill-word
end

function fish_prompt
    set --local exit_code $status

    echo ""

    if test $exit_code -ne 0
        set_color red
    else
        set_color $fish_color_cwd
    end
    echo (prompt_pwd)
    set_color normal

    if test $exit_code -ne 0
        set_color red
    else
        set_color brblue
    end

    if test (id -u) -eq 0
        echo -n "# "
    else
        echo -n "\$ "
    end

    set_color normal
end

set fish_greeting

if test -d "/mnt/c/Users/Admin"
    export PATH=(bash -c "echo \$PATH | tr ':' '\n' | grep -v /mnt/ | tr '\n' ':' | rev | cut -c 2- | rev")
    export PATH="$PATH:$HOME/.bin/"
    export PATH="$PATH:/mnt/c/Users/Admin/AppData/Local/Programs/Microsoft VS Code/bin/"
else if test -d "/mnt/c/Users/nimas"
    export PATH=(bash -c "echo \$PATH | tr ':' '\n' | grep -v /mnt/ | tr '\n' ':' | rev | cut -c 2- | rev")
    export PATH="$PATH:$HOME/.bin/"
    export PATH="$PATH:/mnt/c/Users/nimas/AppData/Local/Programs/Microsoft VS Code/bin/"
end

if type -q code-insiders; and not type -q code
    alias code=code-insiders
end
