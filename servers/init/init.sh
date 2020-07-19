# sudo apt install zsh curl git wget xclip

git clone https://github.com/zsh-users/antigen.git ~/.antigen.repo

wget https://raw.githubusercontent.com/cuongnb14/util-scripts/master/servers/init/.zshrc ~/.zshrc
wget https://raw.githubusercontent.com/cuongnb14/util-scripts/master/servers/init/.zshrc.local ~/.zshrc.local

# vim config
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh