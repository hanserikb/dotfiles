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

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install homebrew/grep
brew install homebrew/openssh

# z hopping around folders
brew install z

# github utils
# https://hub.github.com/
brew install hub

# Install other useful binaries
brew install git
brew install imagemagick --with-webp
brew install nvm # This installs `npm` too using the recommended installation method
brew install pv
brew install rename
brew install tree
brew install zopfli
brew install ffmpeg --with-libvpx
brew install nginx

brew install ncdu # find where your diskspace went

brew install zsh

brew install fzf

# Remove outdated versions from the cellar
brew cleanup
