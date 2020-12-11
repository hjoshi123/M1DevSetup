#!/bin/zsh

# This script only works if the previous deps_part1.sh is ran successfully.
# Pre-requisites: Node.JS v15
# Author: Hemant Joshi

bold=$(tput bold)

node -v
if [ $? -eq 0 ]; then
    npm install -g yarn
else
    printf "${bold}Node.JS is not installed. Please try again..."
fi