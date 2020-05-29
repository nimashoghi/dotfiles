#!/bin/sh

pwsh -c "Install-Module -Force -Name posh-git -Scope CurrentUser -AllowPrerelease"
pwsh -c "Install-Module -Force -Name oh-my-posh -Scope CurrentUser"
pwsh -c "Install-Module -Force -Name Microsoft.PowerShell.UnixCompleters -Scope CurrentUser"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
rm -rf $SCRIPTPATH/.git
cp -rT $SCRIPTPATH ~
rm -rf $SCRIPTPATH ~/install.sh
