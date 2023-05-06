#!/bin/bash

sudo apt-get update && sudo apt-get -y upgrade &&

sudo apt install -y neovim git neofetch curl wget htop &&

## Install ZSH
sudo apt install -y zsh &&
sudo chsh -s $(which zsh) &&

# Install Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg &&
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ &&
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
sudo apt-get install apt-transport-https && sudo apt-get update &&
sudo apt-get install code &&

## Install Node using NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash &&
### Bash
source ~/.bashrc &&
### ZSH
source ~/.zshrc &&
nvm install node &&

## Install Pyenv
curl https://pyenv.run | bash &&
### Bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
### ZSH
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc && 
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc &&
echo 'eval "$(pyenv init -)"' >> ~/.zshrc &&
exec "$SHELL" &&
pyenv install &&


## Install Docker
sudo apt -y update &&
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common &&
sudo apt -y remove docker docker-engine docker.io containerd runc &&

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&

sudo apt -y update &&
sudo apt update &&
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin &&

sudo groupadd docker &&
sudo usermod -aG docker $USER &&
newgrp docker &&

sudo systemctl enable docker.service &&
sudo systemctl enable containerd.service &&
sudo systemctl start docker.service &&
sudo systemctl start containerd.service &&

## PNPM
wget -qO- https://get.pnpm.io/install.sh | sh - &&
### Bash
source ~/.bashrc &&
### ZSH
source ~/.zshrc &&
corepack enable &&

## Phpbrew
sudo apt-get install \
  build-essential \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libcurl4-gnutls-dev \
  libzip-dev \
  libssl-dev \
  libxml2-dev \
  libxslt-dev \
  php8.1-cli \
  php8.1-bz2 \
  php8.1-xml \
  pkg-config \
  libonig-dev -y &&

curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar &&
chmod +x phpbrew.phar &&
sudo mv phpbrew.phar /usr/local/bin/phpbrew &&

phpbrew init &&

echo '[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc' >> ~/.zshrc &&
source ~/.zshrc &&
phpbew update &&
phpbrew install php-8.2 +default &&

## Java JDK
sudo apt-get update && apt-get remove openjdk* &&
sudo apt-get install openjdk-8-jdk -y &&
sudo apt-get install openjdk-17-jdk -y &&

## Install Rust
sudo apt install -y curl gcc make build-essential &&
curl https://sh.rustup.rs -sSf | sh &&
source ~/.profile &&
source ~/.cargo/env &&

## Install Go
sudo apt update && sudo apt install build-essential -y &&
sudo add-apt-repository ppa:longsleep/golang-backports &&
sudo apt update &&
sudo apt install golang-go -y &&

## Install Deno using DVM (Not working)
curl -fsSL https://dvm.deno.dev | sh &&
### Bash
source ~/.bashrc && source ~/.bash_profile &&
### ZSH
source ~/.zshrc && 

dvm install 1.33.2 &&
# curl -fsSL https://deno.land/install.sh | sh &&
# curl https://raw.githubusercontent.com/justjavac/dvm/main/install.sh | sh &&


## Install Kdenlive
sudo add-apt-repository ppa:kdenlive/kdenlive-stable &&
sudo apt-get update &&
sudo apt-get install kdenlive -y &&

## Install OBS Studio
sudo apt install ffmpeg &&
sudo add-apt-repository ppa:obsproject/obs-studio &&
sudo apt update &&
sudo apt install obs-studio -y &&

## Install Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb" &&
# wget -O discord “https://discord.com/api/download?platform=linux&format=deb”
sudo dpkg -i discord.deb &&
sudo apt-get install -f &&
rm discord.deb &&
sudo apt-get update &&
sudo apt-get upgrade -y &&

## Install GIMP
sudo add-apt-repository ppa:savoury1/ffmpeg4 -y &&
sudo add-apt-repository ppa:savoury1/gimp -y &&
sudo apt-get update &&
sudo apt-get upgrade -y &&
sudo apt-get install gimp -y &&

## Android SDK 
