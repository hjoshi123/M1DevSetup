#!/bin/zsh

# Script to install dependencies for a developer on Apple Silicon M1. 
# Pre-requisites: Git, Zsh (Mac uses zsh by default)
# Note: that all dependencies installed through homebrew by default will be done through Rosetta 2 since M1 doesnt't have native support for all formulas.
# Note: Homebrew in rosetta is installed in /usr/local/bin. When M1 support arrives it will be installed in /opt
# Node v15 works on Mac M1 for now. 

# Author: Hemant Joshi

bold=$(tput bold)

check_install_result() {
    if [ $? -eq 0 ]; then
        printf "\n${bold}$1 installed successfully\n"
    fi

    sleep 5
}

printf "${bold}\n--------------------- Welcome to dev setup Part I ---------------------\n\n"
printf "${bold}This includes setting up of homebrew and installing basic dependencies...\n"

if ! [ -x "$(command -v brew)" ]; then
    printf "${bold}\nHomebrew is not installed... Installing homebrew under Rosetta for now...\n"
    brew_output=$(arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)")
    printf "$brew_output"
else
    printf "\nBrew is already installed... Moving ahead...\n\n"
fi

commands_install=(
    zsh-syntax-highlighting 
    go 
    android-platform-tools 
    htop 
    openjdk
    heroku
)

# Installing zsh syntax highlighter
printf "${bold}1. Zsh syntax highlighting\n"
arch -x86_64 brew info ${commands_install[1]} > /dev/null
if [ $? -eq 0 ]; then
    printf "${commands_install[1]} installed successfully\n"
else
    arch -x86_64 brew install ${commands_install[1]}
    check_install_result "${commands_install[1]}"
fi

# Installing go
printf "\n${bold}2. Go\n"
arch -x86_64 brew info ${commands_install[2]} > /dev/null
if [ $? -eq 0 ]; then
    printf "${commands_install[2]} installed successfully\n"
else
    arch -x86_64 brew install ${commands_install[2]}
    check_install_result "${commands_install[2]}"
fi

# Installing adb
printf "\n${bold}3. ADB\n"
arch -x86_64 brew info ${commands_install[3]} > /dev/null
if [ $? -eq 0 ]; then
    printf "${commands_install[3]} installed successfully\n"
else
    arch -x86_64 brew install ${commands_install[3]}
    check_install_result "${commands_install[3]}"
fi

# Installing htop
printf "\n${bold}4. Htop\n"
arch -x86_64 brew info ${commands_install[4]} > /dev/null
if [ $? -eq 0 ]; then
    printf "${commands_install[4]} installed successfully\n"
else
    arch -x86_64 brew install ${commands_install[4]}
    check_install_result "${commands_install[4]}"
fi

# Installing openjdk
printf "\n${bold}5. Openjdk\n"
arch -x86_64 brew info ${commands_install[5]} > /dev/null
if [ $? -eq 0 ]; then
    printf "${commands_install[5]} installed successfully\n"
else
    arch -x86_64 brew install ${commands_install[5]}
    `sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk`
    check_install_result "${commands_install[5]}"
fi

# Installing heroku-cli
printf "\n${bold}6. Heroku CLI\n"
arch -x86_64 brew info ${commands_install[6]} > /dev/null
if [ $? -eq 0 ]; then
    printf "${commands_install[6]} installed successfully\n"
else
    arch -x86_64 brew tap heroku/brew > /dev/null
    arch -x86_64 brew install ${commands_install[6]}
    check_install_result "${commands_install[6]}"
fi

# Installing node
printf "\n${bold}6. Node.JS (Only v15 supported as of now)\n"
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

zsh node_deps.sh
yarn --version
if [ $? -eq 0 ]; then
    printf "${bold}\nYarn installed successfully"
else
    printf "${bold}\nYarn not installed\n"
fi