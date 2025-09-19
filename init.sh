#!/bin/bash
set -euo pipefail

echo "[*] Performing system update..."
dnf upgrade -y && dnf autoremove -y

# Git configuration
echo "[*] Setting up Git..."
git config --global user.name "sivamani70"
git config --global user.email "sivamani.r70@gmail.com"
git config --global init.defaultBranch "main"
git config --global core.editor "code --wait"

# Flatpak setup
echo "[*] Enabling Flatpak support..."
dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Core apps
echo "[*] Installing core applications..."
dnf install -y vim-enhanced \
    google-chrome-stable \
    gnome-tweaks \
    cascadia-code-fonts \
    gcc \
    fragments \
    wireshark \
    wireshark-cli \
    htop \
    gnome-extensions-app


echo "Importing GPG Key from Microsoft"
rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Replace the below 42 with the current fedora version before running the script
dnf install https://packages.microsoft.com/config/fedora/42/packages-microsoft-prod.rpm


# Visual Studio Code
echo "[*] Adding VS Code repository..."
tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
dnf install -y code

# Microsoft Edge
echo "[*] Adding Microsoft Edge repository..."
tee /etc/yum.repos.d/microsoft-edge.repo > /dev/null <<EOF
[microsoft-edge]
name=Microsoft Edge
baseurl=https://packages.microsoft.com/yumrepos/edge
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
dnf install -y microsoft-edge-stable


# Installing Powershell
echo "[*] Installing Powershell"
dnf install powershell -y

# Flatpak apps
echo "[*] Installing Flatpak apps..."
flatpak install -y flathub org.videolan.VLC

# Post-install reminders
echo "[!] To enable packet capture for Wireshark, run as your user:"
echo "    sudo usermod -aG wireshark \$USER && newgrp wireshark"
echo "[✔] Setup completed successfully!"
