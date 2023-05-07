#!/bin/bash

sudo apt-get update && sudo apt-get -y upgrade &&

sudo apt install -y neovim git neofetch curl wget htop &&

## Remove asterisks Mint.
sudo mv /etc/sudoers.d/0pwfeedback /etc/sudoers.d/0pwfeedback.disabled &&

## Install ZSH
sudo apt install -y zsh &&
sudo chsh -s $(which zsh) &&
echo "exec zsh" >> ~/.bashrc

# Install Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg &&
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ &&
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
sudo apt-get install apt-transport-https && sudo apt-get update &&
sudo apt-get install code &&

## Install Node using NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash &&
### Bash
# source ~/.bashrc &&
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
pyenv install 3.11.3 &&


## Install Docker
sudo apt -y update &&
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common &&
# sudo apt -y remove docker docker-engine docker.io containerd runc &&

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&

sudo apt -y update &&
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin &&

sudo groupadd docker &&
sudo usermod -aG docker $USER &&
newgrp docker &&

sudo systemctl enable docker.service &&
sudo systemctl enable containerd.service &&
sudo systemctl start docker.service &&
sudo systemctl start containerd.service &&

## Install Docker Compose
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi - &&
chmod +x docker-compose-linux-x86_64 &&
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose &&


## PNPM (problema al reload)
wget -qO- https://get.pnpm.io/install.sh | sh - &&
### Bash
# source ~/.bashrc &&
### ZSH
source ~/.zshrc &&
corepack enable &&

## Phpbrew (instalado pero error al instalar php)
#sudo apt-get install \
#  build-essential \
#  libbz2-dev \
#  libreadline-dev \
#  libsqlite3-dev \
#  libcurl4-gnutls-dev \
#  libzip-dev \
#  libssl-dev \
#  libxml2-dev \
#  libxslt-dev \
#  php8.1-cli \
#  php8.1-bz2 \
#  php8.1-xml \
#  pkg-config \
#  libonig-dev -y &&

#curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar &&
#chmod +x phpbrew.phar &&
#sudo mv phpbrew.phar /usr/local/bin/phpbrew &&

#phpbrew init &&

#echo '[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc' >> ~/.zshrc &&
#source ~/.zshrc &&
#phpbrew update &&
#phpbrew install php-8.2 +default &&

## Java JDK
sudo apt-get update && 
# apt-get remove openjdk* &&
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

## Install Deno using DVM (Work)
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
sudo apt install libc++1-14 gconf2-common libgconf-2-4 libc++1 && apt --fix-broken install -y &&
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

## MultiMC
cd &&
wget https://files.multimc.org/downloads/multimc_1.6-1.deb &&
sudo apt install -y ./multimc_1.6-1.deb

## Insomnia
cd &&
wget https://github.com/Kong/insomnia/releases/download/core@2023.2.0/Insomnia.Core-2023.2.0.deb &&
sudo apt install -y ./Insomnia.Core-2023.2.0.deb &&

## Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt-get -y update && sudo apt-get install -y yarn && yarn

## Battery Treshold Asus
# cd /etc/systemd/system &&
# sudo touch battery-charge-threshold.service &&

# sudo echo "[Unit]" >> battery-charge-threshold.service &&
# sudo echo "Description=Set the battery charge threshold" >> battery-charge-threshold.service &&
# sudo echo "After=multi-user.target" >> battery-charge-threshold.service &&
# sudo echo "StartLimitBurst=0" >> battery-charge-threshold.service &&
# sudo echo " " >> battery-charge-threshold.service &&
# sudo echo "[Service]" >> battery-charge-threshold.service &&
# sudo echo "Type=oneshot" >> battery-charge-threshold.service &&
# sudo echo "Restart=on-failure" >> battery-charge-threshold.service &&
# sudo echo "ExecStart=/bin/bash -c 'echo 60 > /sys/class/power_supply/BAT0/charge_control_end_threshold'" >> battery-charge-threshold.service &&
# sudo echo " " >> battery-charge-threshold.service &&
# sudo echo "[Install]" >> battery-charge-threshold.service &&
# sudo echo "WantedBy=multi-user.target" >> battery-charge-threshold.service &&

# sudo systemctl enable battery-charge-threshold.service &&
# sudo systemctl start battery-charge-threshold.service &&

## Dart

sudo apt-get update &&

sudo apt-get install apt-transport-https &&

wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg &&

echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list &&

sudo apt-get update &&
sudo apt-get install dart &&


## Google Chrome Stable
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main" &&
sudo apt update &&
sudo apt install -y google-chrome-stable &&

## Intellij Idea Ultimate
cd &&
wget https://download.jetbrains.com/idea/ideaIU-2023.1.1.tar.gz &&
sudo tar -xzf ideaIU-2023.1.1.tar.gz -C /opt &&
cd /opt/idea-IU-231.8770.65 &&
bash ./bin/idea.sh &&


## VmWare
sudo apt update &&
sudo apt install build-essential gcc wget linux-headers-generic linux-headers-$(uname -r) &&
cd /tmp &&
wget --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0" https://www.vmware.com/go/getWorkstation-linux &&
chmod +x getWorkstation-linux &&
sudo ./getWorkstation-linux &&

## SSH Key Github
ssh-keygen -t ed25519 -C "chris@soychristian.com" &&
eval "$(ssh-agent -s)" &&
ssh-add ~/.ssh/id_ed25519 &&

## Alacritty
sudo apt install cmake pkg-config libfreetype6-dev libxkbcommon-dev python3 libfontconfig1-dev libxcb-xfixes0-dev -y &&
git clone https://github.com/jwilm/alacritty.git &&
cargo build --release &&

sudo cp target/release/alacritty /usr/local/bin &&
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg &&
sudo desktop-file-install extra/linux/Alacritty.desktop &&
sudo update-desktop-database &&

## Powerlevel10k
# https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc &&
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

