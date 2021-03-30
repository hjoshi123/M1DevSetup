#!/bin/zsh

source ~/.zshrc
bold=$(tput bold)

pyenv --version
if [ $? -eq 0 ]; then
    printf "\n${bold}Pyenv installed... moving ahead...\n"
    pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)
    pyenv global $(pyenv install --list | grep -v - | grep -v b | tail -1)
else
    printf "\n${bold}Pyenv is not installed... Please try again...\n"
fi
