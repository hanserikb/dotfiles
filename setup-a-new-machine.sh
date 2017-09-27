# Copy paste this file in bit by bit.
# Don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1


#############
#############
# If we're installing on a fresh machine, all copying of files can be skipped
mkdir -p ~/migration/home/
mkdir -p ~/migration/Library/"Application Support"/
mkdir -p ~/migration/Library/Preferences/
mkdir -p ~/migration/Library/Application Support/
mkdir -p ~/migration/rootLibrary/Preferences/SystemConfiguration/

cd ~/migration

# What is worth reinstalling?
brew leaves              > brew-list.txt    # all top-level brew installs
brew cask list           > cask-list.txt
npm list -g --depth=0    > npm-g-list.txt
#yarn global ls --depth=0 > yarn-g-list.txt

# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)

# Backup some dotfiles likely not under source control
cp -Rp \
    ~/.bash_history \
    ~/.extra ~/.extra.fish \
    ~/.gitconfig.local \
    ~/.gnupg \
    ~/.nano \
    ~/.nanorc \
    ~/.netrc \
    ~/.ssh \
    ~/.z   \
        ~/migration/home

# Backup documents
cp -Rp ~/Documents ~/migration
# Backup Wifi settings
cp -Rp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/migration/rootLibrary/Preferences/SystemConfiguration/
# Backup automator stuff
cp -Rp ~/Library/Services ~/migration/Library/ 
# Backup fonts
cp -Rp ~/Library/Fonts ~/migration/Library/

# editor settings & plugins
cp -Rp ~/Library/Application\ Support/Code/ ~/migration/Library/"Application Support"

# Backup pictures, logs, untracked git repos, other important stuff

# iTerm settings.
# Prefs, General, Use settings from Folder

### End of backup
#############
#############



#############
#############
### XCode Command Line Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi
###
#############
#############



#############
#############
### Install Homebrew, package manager!

# if your machine has /usr/local locked down, you can do this to place everything in ~/.homebrew
mkdir $HOME/.homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install all packages applications
./brew.sh
./brew-cask.sh

### end of homebrew
#############
#############



#############
#############
### Install of common things

# github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
bash < <( curl https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh)
# pull	Stash any local changes, pull from remote using rebase, updates submodules, pop your stash, then run bundle install, npm install, yarn install, bower install or composer install if necessary.
# push	Push your changes to the remote + copy a sexy diff URL like http://github.com/jamiew/git-friendly/compare/e96033…5daed4 to your clipboard (works on Mac and Linux)
# branch [name]	Switch branches or create new local branch if it doesn’t exist. Intelligently sets up remote branch tracking so you can just type ‘git pull’ and not always ‘git pull origin newbranch’. If no argument specified will list all local and remote branches.
# merge [name]	Merge the specified branch into the current branch. Rebases first if the branch is local-only

# Install global node modules
sh install_node_modules.sh

# install better nanorc config
# https://github.com/scopatz/nanorc
# curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

# Z - quickly jump around files
# github.com/rupa/z
git clone https://github.com/rupa/z.git ~/code/z
# consider reusing your current .z file if possible. it's painful to rebuild :)
# z is hooked up in .bash_profile


# github.com/thebitguru/play-button-itunes-patch
# disable itunes opening on media keys
# git clone https://github.com/thebitguru/play-button-itunes-patch ~/code/play-button-itunes-patch


# my magic photobooth symlink -> dropbox. I love it.
# 	 + first move Photo Booth folder out of Pictures
# 	 + then start Photo Booth. It'll ask where to put the library.
# 	 + put it in Dropbox/public
# 	* Now… you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
# 	* then you grab public URL and send off your video message in a heartbeat.


# for the c alias (syntax highlighted cat)
sudo easy_install Pygments


# change to bash 4 (installed by homebrew)
## Theese instruction might be changed. Check at fresh install
BASHPATH=$(brew --prefix)/bin/bash
#sudo echo $BASHPATH >> /etc/shells
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X
# Later, confirm iterm settings aren't conflicting.


# Change iterm theme
# Load prefs/Cobalt2.itermcolors into Iterm manually


#############
#############

# Global git config
git config user.email "hanserikb@gmail.com"


#############
#############
### Remaining configuration

# go read mathias, paulmillr, gf3, alraa's dotfiles to see what's worth stealing.

# prezto and antigen communties also have great stuff
#   github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh

# set up osx defaults
# Doesn't work well in OS X Sierra unfortunately 
#   maybe something else in here https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
sh .osx

# setup and run Rescuetime!

#############
#############



#############
#############
### Symlinks to link dotfiles into ~/


# Create .gitignore.local file and enter git credentials, like this (it can also contain tokens n stuff):
# [user]
# name = "*yourname*"
# email = "*youremail*"

# Now .gitconfig can be shared across all machines and only the .local changes

# Symlink all dotfiles into ~
./symlink-setup.sh

# add manual symlink for .ssh/config

###
#############
#############


# List software updates
softwareupdate --list

# Update all listed items, if you wish
softwareupdate --install -a