sudo apt install zsh curl git wget xclip autojump python3-pip vim

sudo pip3 install virtualenvwrapper

git clone https://github.com/zsh-users/antigen.git ~/.antigen.repo

wget https://raw.githubusercontent.com/cuongnb14/util-scripts/master/servers/init/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/cuongnb14/util-scripts/master/servers/init/.zshrc.local -O ~/.zshrc.local
wget https://raw.githubusercontent.com/cuongnb14/util-scripts/master/servers/init/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/cuongnb14/util-scripts/master/servers/init/.autoenv.sh -O ~/.autoenv.sh

# vim config
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

sudo chsh -s $(which zsh) $(whoami)
