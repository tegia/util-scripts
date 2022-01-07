sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget
brew install coreutils
brew instal pod
brew install cocoapods
brew install htop
sudo pip3 install virtualenvwrapper

git clone https://github.com/zsh-users/antigen.git ~/.antigen.repo

wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init/.zshrc.local -O ~/.zshrc.local
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init/.autoenv.sh -O ~/.autoenv.sh
