#!/bin/bash

# Install command-line tools using Homebrew

# Search packages:
# http://searchbrew.com/
# or $ brew search *packagename*

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion2
brew install homebrew/completions/brew-cask-completion

# Install wget
brew install wget

# Install more recent versions of some OS X tools
brew install grep
brew install openssh

# z hopping around folders
brew install z

# github utils
# https://hub.github.com/
brew install hub

# Install other useful binaries
brew install git
brew install imagemagick --with-webp
brew install pv
brew install fzf
brew install rename
brew install tree
brew install zopfli
brew install ffmpeg --with-libvpx
brew install nginx

brew install ncdu # find where your diskspace went

brew install zsh

# Node version manager
# Quick switching between node/npm versions
# After installation, get Node.js LTS:
# $ nvm install --lts
brew install nvm

# Correct previously console command
# https://github.com/nvbn/thefuck
brew install thefuck

# Remove outdated versions from the cellar
brew cleanup
