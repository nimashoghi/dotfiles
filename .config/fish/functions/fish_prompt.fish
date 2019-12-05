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
    echo -n "λ "
    set_color normal
end
