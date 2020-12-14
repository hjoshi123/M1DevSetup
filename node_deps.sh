#!/bin/zsh

# This script only works if the previous deps_part1.sh is ran successfully.
# Author: Hemant Joshi

bold=$(tput bold)

# Installing node
printf "\n${bold}Node.JS (Only v15 supported as of now)\n"
printf "Refer here for more details: https://github.com/nvm-sh/nvm/issues/2350\n"
. ~/.nvm/nvm.sh
nvm > /dev/null
if [ $? -eq 0 ]; then
    printf "NVM Already installed... Proceeding further...\n"
    node -v
    if ! [ $? -eq 0 ]; then
        nvm install node
        check_install_result "Node.JS v15"
        nvm use node
    fi
else
    download=$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh)
    printf "$download"
    check_install_result "NVM"
    `export NVM_DIR="$HOME/.nvm"`
    `[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"` 
    `[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"`
    . ~/.nvm/nvm.sh
    nvm
    if [ $? -eq 0 ]; then
        node_latest=$(nvm install node)
        printf "$node_latest"
        check_install_result "Node.JS v15"
        nvm use node
    else
        printf "\nSomething went wrong... Please try installing again...\n"
    fi
fi

node -v
if [ $? -eq 0 ]; then
    yarn -v
    if ! [ $? -eq 0 ]; then
        npm install -g yarn
    else
        printf "\n${bold}Yarn installed\n"
else
    printf "${bold}Node.JS is not installed. Please try again..."
fi