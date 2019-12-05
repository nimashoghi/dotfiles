function fish_user_key_bindings
    bind --key nul complete-and-search
    bind \b backward-kill-word
    bind \e\[3\;5~ kill-word
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
