#!/bin/sh

pwsh -c "Install-Module -Force -Name posh-git -Scope CurrentUser"
pwsh -c "Install-Module -Force -Name oh-my-posh -Scope CurrentUser"
pwsh -c "Install-Module -Force -Name PSUnixUtilCompleters -Scope CurrentUser -AcceptLicense"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
rm -rf $SCRIPTPATH/.git
cp -rT $SCRIPTPATH ~
rm -rf $SCRIPTPATH ~/install.sh
