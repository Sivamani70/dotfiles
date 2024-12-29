#!/bin/bash


# Run this in the root terminal [Removed all the sudo keywords]

# System update
echo "Performing system update"
dnf update -y &&  dnf upgrade -y &&  dnf autoremove -y

# Setting Up Git
echo "Setting up git values"
git config --global user.name "sivamani70"
git config --global user.email "sivamani.r70@gmail.com"
git config --global init.defaultBranch "main"
git config --global core.editor "code --wait"

# VIM install
echo "Installing VIM"
 dnf install vim-enhanced -y

# Installing Google-Chrome
echo "Installing Google Chrome"
dnf install google-chrome-stable -y

# Installing Gnome-Tweaks
echo "Installing Gnome Tweaks"
dnf install gnome-tweaks -y

# Cascadia code font install 
echo "Installing Cascadia Code Fonts"
dnf install cascadia-code-fonts -y


# Installing gcc
echo "Installing gcc"
dnf install gcc -y

# Installing VS-Code
echo "Installing VS Code"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" |  tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
dnf install code -y




# Installing MS Edge
#  dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
#  dnf install microsoft-edge-stable -y


