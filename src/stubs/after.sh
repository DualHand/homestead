#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

sudo apt-get install zsh -y

rm -rf /home/vagrant/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
sudo chsh -s /usr/bin/zsh vagrant

rm -f /home/vagrant/.zshrc
touch /home/vagrant/.zshrc 

echo set completion-ignore-case on | sudo tee -a /etc/inputrc

git config --global core.excludesfile ~/.gitignore_global
echo ".DS_Store" > ~/.gitignore_global

echo "export PATH=$HOME/bin:/usr/local/bin:$PATH"  >> /home/vagrant/.zshrc
echo "export PATH=$PATH:$HOME/.composer/vendor/bin"  >> /home/vagrant/.zshrc

echo "export ZSH=/home/vagrant/.oh-my-zsh"  >> /home/vagrant/.zshrc
echo "ZSH_THEME='robbyrussell'"  >> /home/vagrant/.zshrc
echo "plugins=(git)"  >> /home/vagrant/.zshrc
echo "source \$ZSH/oh-my-zsh.sh"  >> /home/vagrant/.zshrc
echo "alias composer='php -d memory_limit=-1 /usr/local/bin/composer'"  >> /home/vagrant/.zshrc



echo "alias zshconfig='vim ~/.zshrc'"  >> /home/vagrant/.zshrc
echo "alias ohmyzsh='vim ~/.oh-my-zsh'"  >> /home/vagrant/.zshrc
echo "alias 0='ping google.com'"  >> /home/vagrant/.zshrc
echo "alias ci='php -d memory_limit=-1 /usr/local/bin/composer install'"  >> /home/vagrant/.zshrc
echo "alias cu='php -d memory_limit=-1 /usr/local/bin/composer update'"  >> /home/vagrant/.zshrc
echo "alias cuwam='php -d memory_limit=-1 /usr/local/bin/composer update wearemarketing/wearemarketing'"  >> /home/vagrant/.zshrc
echo "alias composer='php -d memory_limit=-1 /usr/local/bin/composer'"  >> /home/vagrant/.zshrc

sudo touch /usr/local/extra_homestead_software_installed
