sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget
brew install coreutils
brew instal pod
brew install cocoapods
brew install htop
brew install --cask slack
brew install --cask discord
brew install --cask skype
brew install --cask telegram
sudo pip3 install virtualenvwrapper

git clone https://github.com/zsh-users/antigen.git ~/.antigen.repo
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init-macos/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init-macos/.zshrc.local -O ~/.zshrc.local
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init-macos/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/tegia/util-scripts/master/servers/init-macos/.autoenv.sh -O ~/.autoenv.sh
