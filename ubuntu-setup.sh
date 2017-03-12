#!/bin/sh

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get -y install nvidia-367
sudo apt-get -y install mesa-common-dev
sudo apt-get -y install freeglut3-dev

sudo apt install solaar # for Logicool Mouse

sudo apt-get install libappindicator1
echo "plz install google chrome"

sudo apt -y install git
sudo apt -y install gcc g++ make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
sudo apt -y install vim-gnome

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
cat 7fa2af80.pub | sudo apt-key add -

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt update

sudo apt -y install linux-generic
sudo apt -y install cuda nvidia-375 --reinstall
#sudo reboot

#sudo apt remove linux-virtual
sudo apt autoremove

rm 7fa2af80.pub cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

echo -e "\n## CUDA and cuDNN paths"  >> ~/.bashrc
echo 'export PATH=/usr/local/cuda-8.0/bin:${PATH}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:${LD_LIBRARY_PATH}' >> ~/.bashrc
source ~/.bashrc

cuda-install-samples-8.0.sh ~ 
cd ~/NVIDIA_CUDA-8.0_Samples/
LIBRARY_PATH=/usr/lib/nvidia-375 make

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc 
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc 
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

pyenv install anaconda3-4.2.0
pyenv rehash
pyenv global anaconda3-4.2.0
conda create -y -n kaggle python=3.5
pyenv global system

cat << EOF > /usr/share/X11/xorg.conf.d/20-natural-scrolling.conf
Section "InputClass"
        Identifier "Natural Scrolling"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Option "VertScrollDelta" "-1"
        Option "HorizScrollDelta" "-1"
        Option "DialDelta" "-1"
EndSection
EOF 

sudo apt -y install zsh tmux ctags

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo chsh -s /usr/bin/zsh

#xinput set-prop {device id} {property number} -1 -1 -1

sudo reboot
