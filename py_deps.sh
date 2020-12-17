#!/bin/zsh

source ~/.zshrc
bold=$(tput bold)

pyenv --version
if [ $? -eq 0 ]; then
    printf "\n${bold}Pyenv installed... moving ahead...\n"
    ibrew install zlib
    ibrew install readline
    arch -x86_64 pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)
    arch -x86_64 pyenv global $(pyenv install --list | grep -v - | grep -v b | tail -1)
else
    printf "\n${bold}Pyenv is not installed... Please try again...\n"
fi
