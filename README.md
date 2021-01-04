# Mac OS Big Sur Apple Silicon Dev Setup

## Table of Contents

* [Introduction](#introduction)
* [Dependencies](#dependencies)
* [How to run](#how-to-run)
* [Part 1](#part-1)
* [Part 2](#part-2)
* [Disclaimer](#disclaimer)

## Introduction

This repository handles installation of dependencies on Apple Silicon M1. The pre-requisites for this repo to be running is nothing. Ideally, this is to scratch setup i.e. if you have freshly purchased a Macbook M1.

## Dependencies

* Zsh (default shell in Mac os)
* Installation of `oh-my-zsh` is recommended since it has default tools and plugins. Refer `prereq.sh` file for installations.
* Git (Xcode Command line tools. If not present run `xcode-select --install`)

## How to run

To execute the scripts, first you need to open the terminal of your choice preferrably `iTerm2`.
* If you have `oh-my-zsh` installed, you can skip the `prereq.sh`. If not, enter `zsh prereq.sh` which will install the shell.
* Once this done, you can move ahead in installing dependencies, by running `zsh deps_part1.sh`. This will install all the dependencies listed below.

## Part 1

Part 1 deals with installing basic dependencies necessary for developer to get started. Following are the tools that are supported as of now. Do note that all dependencies installed through `brew` will be under Rosetta 2. Native Support for `brew` hasn't yet arrived completely.

- [x] Homebrew
- [x] Golang
- [x] ADB
- [x] OpenJDK
- [x] Htop
- [x] Node.JS (As of now, only v15 is supported)
- [x] NVM (Node Version Manager)
- [x] Heroku CLI
- [x] Redis
- [x] PostgreSQL
- [x] Yarn
- [x] Python
- [x] sqlc - SQL Compiler

Note that `Node.JS` would take a bit of time to install, as it needs to be built from source. This might involve usage of all cores and laptop getting a bit hot. `Python 3.9` is being installed currently under `Rosetta` as under Apple Silicon it shows a message of `arch not known`. This could be changed in the near future.

## Part 2

- [x] [Docker Developer Release](https://docs.docker.com/docker-for-mac/apple-m1/)

## Disclaimer

Note that `homebrew` under Rosetta is installed in `/usr/local/bin`. The official M1 supported version would be installed in `/opt/homebrew`. Whichever brew is in your path first will run when you use brew. If it’s the `/usr/local` one, you’ll need to add the `arch -x86_64` prefix every time. Your best bet for using both is to alias one of them.

To avoid this situation, what could be done is that Rosetta Homebrew could be given an alias like `ibrew` so that your brew points to the actual `ARM M1` version when the full support comes. This is a WIP and I will update the scripts so that we can have a native brew and an `ibrew` for Rosetta 2.

Some things might be broken in the script, I am working to fix the problems. Your comments and suggestions in the form of issues are always appreciated.
