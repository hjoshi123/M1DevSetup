#!/bin/sh

echo "\n---------------------Welcome to dev setup Part I...---------------------\n"
echo "This includes setting up of homebrew and installing basic dependencies...\n"

if ! [ -x "$(command -v brew)" ]; then
    echo "Homebrew is not installed... Installing homebrew under Rosetta for now..."
    brew_output=$(arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)")
    echo "$brew_output"
else
    echo "Brew is already installed... Moving ahead...\n"
fi

commands=("zsh-syntax-higlighting" "go" "android-platform-tools")
bold=$(tput bold)

# Installing zsh syntax highlighter
echo "${bold}1. Zsh syntax highlighting"
zsh_syntax=$(arch -x86_64 brew install ${commands[0]})
if [ $? -eq 0 ]; then
    echo "${commands[0]} installed successfully (under Rosetta 2)\n"
else
    echo "$zsh_syntax\n"
fi

# Installing go
echo "${bold}2. Go\n"
go=$(arch -x86_64 brew install ${commands[1]})
if [ $? -eq 0 ]; then
    echo "Go installed successfully (under Rosetta 2)\n"
else
    echo "$go\n"
fi

# Installing adb
adb=$(arch -x86_64 brew install ${commands[2]})
if [ $? -eq 0 ]; then
    echo "${commands[2]} installed successfully (under Rosetta 2)\n"
else
    echo "$adb\n"
fi