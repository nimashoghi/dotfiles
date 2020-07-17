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
$env:COMPLETION_SHELL_PREFERENCE = "zsh"
Import-Module -Name Microsoft.PowerShell.UnixCompleters, oh-my-posh, posh-git
Set-UnixCompleter -ShellType Zsh

# theme settings
Set-Theme pure
$ThemeSettings.PromptSymbols.PromptIndicator = "λ"
Set-PSReadLineOption -Colors @{
    Member    = "Magenta"
    Number    = "Magenta"
    Type      = "DarkGreen"
    Selection = "DarkGreen"
}

# environment variables
$env:DOCKER_CLI_EXPERIMENTAL = "enabled"
$env:TERM = "xterm-256color"
$env:PATH += ":/home/nimas/.local/bin"

# functions
function mkdir() {
    <#
    .FORWARDHELPTARGETNAME New-Item
    .FORWARDHELPCATEGORY Cmdlet
    #>

    [CmdletBinding(DefaultParameterSetName = 'pathSet',
        SupportsShouldProcess = $true,
        SupportsTransactions = $true,
        ConfirmImpact = 'Medium')]
    [OutputType([System.IO.DirectoryInfo])]
    param(
        [Parameter(ParameterSetName = 'nameSet', Position = 0, ValueFromPipelineByPropertyName = $true)]
        [Parameter(ParameterSetName = 'pathSet', Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [System.String[]]
        ${Path},

        [Parameter(ParameterSetName = 'nameSet', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [AllowNull()]
        [AllowEmptyString()]
        [System.String]
        ${Name},

        [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [System.Object]
        ${Value},

        [Switch]
        ${Force},

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [System.Management.Automation.PSCredential]
        ${Credential}
    )

    begin {
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('New-Item', [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = { & $wrappedCmd -Type Directory @PSBoundParameters }

        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($PSCmdlet)
    }

    process {
        $steppablePipeline.Process($_)
    }

    end {
        $steppablePipeline.End()
    }
}

# aliases
Set-Alias ac Add-Content
Set-Alias cat Get-Content
Set-Alias clear Clear-Host
Set-Alias compare Compare-Object
Set-Alias cp Copy-Item
Set-Alias cpp Copy-ItemProperty
Set-Alias diff Compare-Object
Set-Alias gin Get-ComputerInfo
Set-Alias gsv Get-Service
Set-Alias kill Stop-Process
Set-Alias ls Get-ChildItem
Set-Alias man help
Set-Alias mount New-PSDrive
Set-Alias mv Move-Item
Set-Alias ogv Out-GridView
Set-Alias ps Get-Process
Set-Alias rm Remove-Item
Set-Alias rmdir Remove-Item
Set-Alias sasv Start-Service
Set-Alias shcm Show-Command
Set-Alias sleep Start-Sleep
Set-Alias sort Sort-Object
Set-Alias spsv Stop-Service
Set-Alias start Start-Process
Set-Alias stz Set-TimeZone
Set-Alias tee Tee-Object
Set-Alias write Write-Output

function CodeHere() {
    code .
}
Set-Alias code. CodeHere

function Google(
    [string[]]
    [Parameter(ValueFromRemainingArguments)]
    $Query
) {
    $queryEscaped = [System.Web.HttpUtility]::UrlEncode($Query -join " ")
    $url = "https://www.google.com/search?q=$queryEscaped"
    google-chrome $url
}
