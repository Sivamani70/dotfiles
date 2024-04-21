#!/bin/bash

# System update
sudo dnf update -y && sudo dnf upgrade -y && sudo dnf autoremove -y

# Setting Up Git
git config --global user.name "sivamani70"
git config --global user.email "sivamani.r70@gmail.com"
git config --global init.defaultBranch "main"
git config --global core.editor "code --wait"

# VIM install
sudo dnf install vim-enhanced -y
# Installing Google-Chorme
sudo dnf install google-chrome-stable -y

# Insatlling Gnome-Tweaks
sudo dnf install gnome-tweaks -y

# Cascadia code font install 
sudo dnf install cascadia-code-fonts -y

# Importing MicroSoft GPG Key
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc


# Installing VS-Code
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code -y

curl -sSL -O https://packages.microsoft.com/config/fedora/39/packages-microsoft-prod.rpm
sudo rpm -i packages-microsoft-prod.rpm
rm packages-microsoft-prod.rpm
sudo dnf update

# Installing MS Edge
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf install microsoft-edge-stable -y

# Installing powershell
sudo dnf install https://github.com/PowerShell/PowerShell/releases/download/v7.4.2/powershell-7.4.2-1.rh.x86_64.rpm -y
