#!/bin/sh

pwsh -c "Install-Module -Force -Name PSReadLine -AllowPrerelease -Scope CurrentUser"
pwsh -c "Install-Module -Force -Name Microsoft.PowerShell.UnixCompleters -Scope CurrentUser"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
rm -rf $SCRIPTPATH/.git
cp -rT $SCRIPTPATH ~
rm -rf $SCRIPTPATH ~/install.sh
