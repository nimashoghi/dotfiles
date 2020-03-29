#!/bin/sh

pwsh -c "Install-Module -Force -Name DockerCompletion -Scope CurrentUser"
pwsh -c "Install-Module -Force -Name Posh-Git -Scope CurrentUser"
pwsh -c "Install-Module -Force -Name Set-PsEnv -Scope CurrentUser"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cp -rT $SCRIPTPATH ~
rm -rf $SCRIPTPATH ~/install.sh
