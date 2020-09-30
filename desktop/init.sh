# joplin
echo "Installing Joplin..."
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

# Install discrod
wget https://discord.com/api/download?platform=linux&format=deb -O discord.deb && sudo dpkg -i discord.deb && rm discord.deb