#!/bin/bash

# Search casks
# https://caskroom.github.io/search


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Tap into the cask repository
brew tap caskroom/cask

# Daily-used applications
brew cask install visual-studio-code #vscode
brew cask install sourcetree # git gui
brew cask install spotify # music
brew cask install evernote # note-taking
brew cask install gyazo # screenshotting
#brew cask install flux # screen-dimming
brew cask install slack # communication
brew cask install iterm2 # terminal
brew cask install imagealpha # image minifier
brew cask install imageoptim # fast image optimiser

# Browsers
# brew cask install google-chrome-canary
# brew cask install google-chrome
# brew cask install firefoxnightly
# brew cask install webkit-nightly
# brew cask install chromium
# brew cask install torbrowser

# Other
#brew cask install disk-inventory-x # where did my diskspace go?
brew cask install vlc # video player
#brew cask install utorrent # torrents
brew cask install fliqlo # screensaver
