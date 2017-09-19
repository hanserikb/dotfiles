#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps
brew tap caskroom/cask

# Daily-used applications
brew cask install spotify
brew cask install visual-studio-code
brew cask install sourcetree
brew cask install evernote
brew cask install gyazo
brew cask install flux

brew cask install iterm2
brew cask install imagealpha
brew cask install imageoptim

# browsers
# brew cask install google-chrome-canary
brew cask install google-chrome
# brew cask install firefoxnightly
# brew cask install webkit-nightly
# brew cask install chromium
# brew cask install torbrowser


# Other
brew cask install disk-inventory-x
brew cask install vlc
brew cask install utorrent