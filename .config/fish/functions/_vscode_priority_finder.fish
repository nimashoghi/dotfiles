function _vscode_priority_finder
    if type -q code-insiders
        command code-insiders $argv
    else if type -q code
        command code $argv
    else
        echo "Error: Neither VS Code Insiders nor VS Code is installed." >&2
        return 1
    end
end
