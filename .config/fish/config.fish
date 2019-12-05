function fish_user_key_bindings
    bind --key nul complete-and-search
    bind \b backward-kill-word
    bind \e\[3\;5~ kill-word
end

set fish_greeting

export PATH=(bash -c "echo \$PATH | tr ':' '\n' | grep -v /mnt/ | tr '\n' ':' | rev | cut -c 2- | rev")
export PATH="$PATH:$HOME/.bin/"
export PATH="$PATH:/mnt/c/Users/nimas/AppData/Local/Programs/Microsoft VS Code/bin/"
