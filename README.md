# Mac OS Big Sur Apple Silicon Dev Setup

## Table of Contents

* [Introduction](#introduction)
* [Dependencies](#dependencies)
* [Part 1](#part-1)
* [Disclaimer](#disclaimer)

## Introduction

This repository handles installation of dependencies on Apple Silicon M1. The pre-requisites for this repo to be running is nothing. Ideally, this is to scratch setup i.e. if you have freshly purchased a Macbook M1.

## Dependencies

* Zsh (default shell in Mac os)
* Installation of `oh-my-zsh` is recommended since it has default tools and plugins. Refer `prereq.sh` file for installations.
* Git (Xcode Command line tools. If not present run `xcode-select --install`)

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
- [x] Yarn
- [ ] Python (WIP)

Note that `Node.JS` would take a bit of time to install, as it needs to be built from source. This might involve usage of all cores and laptop getting a bit hot.

## Disclaimer

Note that `homebrew` under Rosetta is installed in `/usr/local/bin`. The official M1 supported version would be installed in `/opt/homebrew`. Whichever brew is in your path first will run when you use brew. If it’s the `/usr/local` one, you’ll need to add the `arch -x86_64` prefix every time. Your best bet for using both is to alias one of them.

To avoid this situation, what could be done is that Rosetta Homebrew could be given an alias like `ibrew` so that your brew points to the actual `ARM M1` version when the full support comes. This is a WIP and I will update the scripts so that we can have a native brew and an `rbrew` for Rosetta 2.
