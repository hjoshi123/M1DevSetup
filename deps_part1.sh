#!/bin/zsh

# Script to install dependencies for a developer on Apple Silicon M1. 
# Pre-requisites: Git, Zsh (Mac uses zsh by default)
# Note: that all dependencies installed through homebrew by default will be done through Rosetta 2 since M1 doesnt't have native support for all formulas.
# Note: Homebrew in rosetta is installed in /usr/local/bin. When M1 support arrives it will be installed in /opt
# Node v15 works on Mac M1 for now. 

# Author: Hemant Joshi

check_install_result() {
    if [ $? -eq 0 ]; then
        printf "\n$1 installed successfully\n"
    fi

    sleep 5
}

printf "\n--------------------- Welcome to dev setup Part I ---------------------\n\n"
printf "This includes setting up of homebrew and installing basic dependencies...\n"

if ! [ -x "$(command -v brew)" ]; then
    printf "\nHomebrew is not installed... Installing homebrew under Rosetta for now...\n"
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
)

bold=$(tput bold)

# Installing zsh syntax highlighter
printf "${bold}1. Zsh syntax highlighting\n"
zsh_syntax=$(arch -x86_64 brew install ${commands_install[1]})
printf "$zsh_syntax"
check_install_result "${commands_install[1]}"

# Installing go
printf "\n${bold}2. Go\n"
go=$(arch -x86_64 brew install ${commands_install[2]})
printf "$go"
check_install_result "${commands_install[2]}"

# Installing adb
printf "\n${bold}3. ADB\n"
adb=$(arch -x86_64 brew install ${commands_install[3]})
printf "$adb"
check_install_result "${commands_install[3]}"

# Installing htop
printf "\n${bold}4. Htop\n"
htop=$(arch -x86_64 brew install ${commands_install[4]})
printf "$htop"
check_install_result "${commands_install[4]}"

# Installing openjdk
printf "\n${bold}5. Openjdk\n"
jdk=$(arch -x86_64 brew install ${commands_install[5]})
`sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk`
printf "$jdk"

# Installing node
printf "\n${bold}6. Node.JS (Only v15 supported as of now\n"
printf "Refer here for more details: https://github.com/nvm-sh/nvm/issues/2350\n"
download=$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh)
printf "$download"
check_install_result "NVM"
`export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"`
`source /Users/`whoami`/.zshrc`

if ! [ -x "$(command -v nvm)" ]; then
    printf "\nSomething went wrong... Please try installing again...\n"
else
    node_latest=$(nvm install node)
    printf "$node_latest"
    check_install_result "Node.JS v15"
    use_node=$(nvm use node)
fi