#!/bin/zsh

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ibrew() {
    arch -x86_64 brew $1 $2
}

ibrew info go