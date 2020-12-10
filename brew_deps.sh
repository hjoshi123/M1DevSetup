#!/bin/sh

check_install_result() {
    if [ $? -eq 0 ]; then
        echo "$1 installed successfully (under Rosetta 2)\n"
    else
        echo "$2\n"
    fi 
}

echo "\n---------------------Welcome to dev setup Part I...---------------------\n"
echo "This includes setting up of homebrew and installing basic dependencies...\n"

if ! [ -x "$(command -v brew)" ]; then
    echo "Homebrew is not installed... Installing homebrew under Rosetta for now..."
    brew_output=$(arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)")
    echo "$brew_output"
else
    echo "Brew is already installed... Moving ahead...\n"
fi

commands=("zsh-syntax-higlighting" "go" "android-platform-tools" "htop" "openjdk")
prefix="arch -x86_64"
bold=$(tput bold)

# Installing zsh syntax highlighter
echo "${bold}1. Zsh syntax highlighting"
zsh_syntax=$(${prefix} brew install ${commands[0]})
check_install_result "${commands[0]}" "$zsh_syntax"

# Installing go
echo "${bold}2. Go\n"
go=$(${prefix} brew install ${commands[1]})
check_install_result "${commands[1]}" "$go"

# Installing adb
echo "${bold}3. ADB\n"
adb=$(${prefix} brew install ${commands[2]})
check_install_result "${commands[2]}" "$adb"

# Installing htop
echo "${bold}4. Htop\n"
htop=$(${prefix} brew install ${commands[3]})
check_install_result "${commands[3]}" "$htop"

# Installing openjdk
echo "${bold}5. Openjdk\n"
jdk=$(${prefix} brew install ${commands[4]})
check_install_result "${commands[4]}" "$jdk"
