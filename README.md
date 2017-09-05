These are my dotfiles. Take anything you want, but at your own risk. It targets macOS systems. 

# .files
I've organized the dotfiles into the following major categories:

.
├── bin
│ └── dotfiles 
├── git
│ ├── .gitconfig
│ └── .gitignore_global
├── install
│ ├── bash.sh
│ ├── brew-cask.sh
│ ├── brew.sh
│ ├── gem.sh
│ └── npm.sh
├── *install.sh*
├── macos
│ ├── defaults.sh
│ └── dock.sh
├── system
│ ├── .alias
│ ├── .alias.macos
│ ├── .bash_profile
│ ├── .completion
│ ├── .env
│ ├── .function
│ ├── .function.macos
│ ├── .function_fs
│ ├── .gemrc
│ ├── .inputrc
│ ├── .nvm
│ ├── .path
│ ├── .prompt
│ └── .rvm
├── test
│ ├── bin.bats
│ └── function.bats
└── vim
 └── .vimrc

- - - -

### install.sh
This is the core script that coordiates all the others. The major steps it takes are: 
	1. Soure common function in `system/*`
	2. Updates the dotfiles from this repo on Github
	3. Creates symlinks from this repo to where bash expects it
	4. Configures vim from `vim/`
	5. Configures other package managers from `install/`
	6. Runs tests from `test`
	7. Install any extra stuff based on local configurations from in `extra/`

### bin/
Contains additional functions: 
	- `dotfiles` is used to update the macos defaults and dock settings.

### git/
Contains git configuration files: `.gitconfig` and `.gitignore_global`

### install/
Contains a variety of installation scripts: 
	- `bash.sh` to install bash
	- `brew-cash.sh` to install macOS apps, fonts and Quick Look plugins
	- `brew.sh` to install a common brew packages
	- `gem.sh` to install ruby and other gems
	- `npm.sh` to install node and other node packages

### macos/
Configures macOS and dock defaults with `defaults.sh` and `dock.sh`. Heavily inspired from [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos).

### system
Contain most of configuration files for bash: 
	- `.alias*` contains abbreviations, command shortcuts, etc. 
	- `.bash_profile`
	- `.completion` contains completion scripts for Bash, custom dotfiles command, grunt, killall, and brew
	- `.env` contains all the environment variable goodies
	- `.function*` contains custom bash function
	- `.path` sets up Bash path
	- `.prompt` sets up Bash path prompts 

### test
Contains a few tests to verify that custom functions loaded properly 

### vim
Contains vim configuration file, `.vimrc`

- - - - 

# Installation

On a sparkling fresh installation of macOS:

    sudo softwareupdate -i -a
    xcode-select --install

Install the dotfiles with either Git or curl:

### Clone with Git

    git clone https://github.com/jeremybeasley/dotfiles.git ~/.dotfiles
    source ~/.dotfiles/install.sh
	
- - - -

# Usage

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>
    
    Commands:
       clean            Clean up caches (brew, npm, gem, rvm)
       dock             Apply macOS Dock settings
       edit             Open dotfiles in IDE (ws) and Git GUI (stree)
       help             This help message
       macos            Apply macOS system defaults
       test             Run tests
       update           Update packages and pkg managers (OS, brew, npm, gem)

