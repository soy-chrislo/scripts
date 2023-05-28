sudo add-apt-repository ppa:longsleep/golang-backports -y && sleep 1 &&
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y && sleep 1 &&
sudo add-apt-repository ppa:obsproject/obs-studio -y && sleep 1 &&
sudo add-apt-repository ppa:savoury1/ffmpeg4 -y && sleep 1 &&
sudo add-apt-repository ppa:savoury1/gimp -y && sleep 1 &&
sudo add-apt-repository ppa:maarten-fonville/android-studio -y && sleep 1 &&
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list -y &&
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list -y &&
sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main" &&
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 