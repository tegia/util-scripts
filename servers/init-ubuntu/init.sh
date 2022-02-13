sudo apt install guake
sudo apt install zsh curl git wget xclip autojump python3-pip vim

sudo pip3 install virtualenvwrapper

git clone https://github.com/zsh-users/antigen.git ~/.antigen.repo

wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init-ubuntu/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init-ubuntu/.zshrc.local -O ~/.zshrc.local
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init-ubuntu/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init-ubuntu/.autoenv.sh -O ~/.autoenv.sh

# vim config
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

sudo chsh -s $(which zsh) $(whoami)

# install docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt install docker-ce
sudo usermod -aG docker ${USER}

