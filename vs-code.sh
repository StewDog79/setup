#!/usr/bin/env bash
source ../../lib.sh
bot "Installing Visual Studio code extensions and config."
code -v > /dev/null
if [[ $? -eq 0 ]];then
    read -r -p "Do you want to install VSC extensions? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        ok "Installing extensions please wait..."
        code --install-extension esbenp.prettier-vscode
        code --install-extension ms-vsliveshare.vsliveshare
        # code --install-extension foxundermoon.shell-format
        # code --install-extension glenn2223.live-sass
        # code --install-extension GrapeCity.gc-excelviewer
        # code --install-extension hashicorp.terraform
        # code --install-extension mechatroner.rainbow-csv
        # code --install-extension mohd-akram.vscode-html-format
        # code --install-extension ms-python.isort
        # code --install-extension ms-python.python
        # code --install-extension ms-python.vscode-pylance
        # code --install-extension ms-toolsai.jupyter
        # code --install-extension ms-toolsai.jupyter-keymap
        # code --install-extension ms-toolsai.jupyter-renderers
        # code --install-extension ms-toolsai.vscode-jupyter-cell-tags
        # code --install-extension ms-toolsai.vscode-jupyter-slideshow
        # code --install-extension ritwickdey.LiveServer
        # code --install-extension shakram02.bash-beautify
        # code --install-extension syler.sass-indented
        # code --install-extension ZainChen.json
        ok "Extensions for VSC have been installed. Please restart your VSC."
    else
        ok "Skipping extension install.";
    fi
else
    error "It looks like the command 'code' isn't accessible."
    error "Please make sure you have Visual Studio Code installed"
    error "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
fi