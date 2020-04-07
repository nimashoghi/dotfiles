Set-PSReadLineKeyHandler -Key Enter -Function AcceptLine
Set-PSReadLineKeyHandler -Chord Shift+Enter -Function AddLine

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function ForwardWord

Set-PSReadLineKeyHandler -Chord Ctrl+Shift+LeftArrow -Function SelectBackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+RightArrow -Function SelectForwardWord

Set-PSReadLineKeyHandler -Key Home -Function BeginningOfline
Set-PSReadLineKeyHandler -Key End -Function EndOfLine

Set-PSReadLineKeyHandler -Chord Shift+Home -Function SelectBackwardsLine
Set-PSReadLineKeyHandler -Chord Shift+End -Function SelectLine

Set-PSReadLineKeyHandler -Key Backspace -Function BackwardDeleteChar
Set-PSReadLineKeyHandler -Key Delete -Function DeleteChar

Set-PSReadLineKeyHandler -Chord Ctrl+Backspace -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord Ctrl+Delete -Function DeleteWord

Set-PSReadlineKeyHandler -Key UpArrow -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}
Set-PSReadlineKeyHandler -Key DownArrow -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

New-Alias open ii

# imports
Import-Module -Name posh-git, oh-my-posh

# theme settings
Set-Theme pure
$ThemeSettings.PromptSymbols.PromptIndicator = "λ"
Set-PSReadLineOption -Colors @{
    Member    = "Magenta"
    Number    = "Magenta"
    Type      = "DarkGreen"
    Selection = "DarkGreen"
}

Clear-Host
