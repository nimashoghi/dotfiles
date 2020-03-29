#!/bin/sh

Install-Module -Name DockerCompletion -Scope CurrentUser
Install-Module -Name Posh-Git -Scope CurrentUser
Install-Module -Name Set-PsEnv -Scope CurrentUser

cp -R ~/dotfiles/* ~/
rm -rf ~/dotfiles ~/install.sh
