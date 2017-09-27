# Dotfiles

Forked from paulirish, modified to suit my needs.
## Setup
#### Installing & using
* Read and run parts of `setup-a-new-machine.sh`
* Read and run `symlink-setup.sh`


#### Shell
This repo contains config for bash, zsh, and fish.

## Files

### [`.aliases`](https://github.com/hanserikb/dotfilez/blob/master/.aliases)
Sets up a bunch of aliases. Examples:

Command | Alias for..
--- | ---
.. | ```cd ..```|
... | ```cd ../..```|
.... | ```cd ../../..```|
..... | ```cd ../../../..```|
g | ```git```|
freewifi | Spoofs mac address for free public wifi |
serve | Starts a simple web server |
master | ```git checkout master``` |

[`.functions`](https://github.com/hanserikb/dotfilez/blob/master/.functions)
Sets up some useful functions. Examples:

Command | Function for..
--- | ---
md | Create a new directory and enter it |
cp_p | Copy with progress |
whois | Get whois data |
localip | Get local ip addresses |

### The "readline config" (`.inputrc`)
Basically it makes typing into the prompt amazing.

* Tab like crazy for autocompletion that doesnt suck. tab all the things.
* No more <tab><tab> that says "Display all 1745 possibilities? (y or n)" YAY
* Type `whatevercommans <uparrow>` to see your previous `whatevercommans`s and use them.
* Case insensitivity.


### Moving around in folders (`z`, `cdf`)
`z` helps you jump around to whatever folder. It uses actual real magic to determine where you should jump to. Then, if you have a folder open in Finder, `cdf` will bring you to it.
```sh
z dotfiles
z blog
z public
cdf       # cd to whatever's up in Finder
```
`z` learns only once its installed so you'll have to cd around for a bit to get it taught.
Lastly, I use `open .` to open Finder from this path.



## Overview of files

####  Automatic config
* `.vimrc`, `.vim` - vim config, obv.
* `.inputrc` - behavior of the actual prompt line

#### Shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.extra` - not included, explained below

#### Manual run
* `setup-a-new-machine.sh` - random apps i need installed
* `symlink-setup.sh`  - sets up symlinks for all dotfiles and vim config.
* `.osx` - run on a fresh osx setup
* `brew.sh` & `brew-cask.sh` - homebrew initialization

#### git, brah
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`


### `.extra` for your private configuration

There will be items that don't belong to be committed to a git repo, because either 1) it shoudn't be the same across your machines or 2) it shouldn't be in a git repo. Kick it off like this:

`touch ~/.extra && $EDITOR $_`

I have some EXPORTS, my PATH construction, and a few aliases for ssh'ing into my servers in there.

I don't know how other folks manage their $PATH, but this is how I do mine:

```shell
# The top-most paths override here.
      PATH=/opt/local/bin
PATH=$PATH:/opt/local/sbin
PATH=$PATH:/bin
PATH=$PATH:~/.rvm/bin
PATH=$PATH:~/code/git-friendly
# ...

export PATH
```
