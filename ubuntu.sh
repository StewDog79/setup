#!/bin/bash
# stolen ideas from ThePrimeagen (https://www.youtube.com/watch?v=x2QJYq4IX6M&ab_channel=ThePrimeagen) and https://github.com/mrousavy/dotfiles/blob/master/install.sh
# SCRIPT TO INSTALL MY IMPORTANT DOTFILES AND PLUGINS TO USER DIR

#### APT ####
read -p "Run system update/upgrade and install core Apt packages (including AWS CLI)? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Update sources
    sudo apt update
    sudo apt upgrade

    # Install Reqired packages
    sudo apt install curl git wget 7zip zip ssh awscli
fi

#### Python ####
read -p "Install Python Bits? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install build-essential cmake python3 python3-dev python3-pip 
fi

#### Node ####
read -p "Install NODE Bits? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
    source ~/.bashrc
    nvm install node
fi

#### TMUX ####
read -p "Do you want to intall and pimp up TMUX? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ### tmux
    sudo apt install xstow tmux

    # link tmux/tmux.conf to ~/.tmux - rememeber this needs to be run from /setup
    xstow -t ~/ -d conf-files/ tmux

    # install tpm (tmux package manager)
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    ## Ignore for now... this can be run from inside tmux instead...
    # i.e. run tmux source ~/.tmux.conf or :source-file ~/.tmux.conf inside tmux
    #      then do prefix + I to install all the plugins

    # source .tmux.conf
    tmux source ~/.tmux.conf

    # install plugins from .tmux.conf (same as prefix + I when inside tmux)
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

#### Terraform ####
read -p "Install Terraform? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform
fi

#### SSH ####
read -p "Do you want to generate new ssh keys? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
test -f ~/.ssh/id_rsa.pub && echo "Already exists" || ssh-keygen
echo "Don't forget to install your pubkey to github etc"
fi

#### Link stuff ####
read -p "Run XStow to setup you profile? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
cd ./conf-files
xstow -t -f ~/ *
fi