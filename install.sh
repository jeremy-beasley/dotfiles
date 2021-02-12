#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"

# Source common functions
. "$DOTFILES_DIR/system/.function"
. "$DOTFILES_DIR/system/.function.macos"
. "$DOTFILES_DIR/system/.function_fs"

# Update dotfiles from github repo 
if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Create symlinks from repo to where Bash expects it
ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~
ln -sfv "$DOTFILES_DIR/system/.gemrc" ~
ln -sfv "$DOTFILES_DIR/system/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/system/.condarc" ~
ln -sfv "$DOTFILES_DIR/system/.ctags" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/system/.asciinema_config" ~/.config/asciinema/config
ln -sfv "$DOTFILES_DIR/system/.zshrc" ~

# Configure vim with vim-plug and initialize plugins
# Clone Vundle if doesn't exist
if [ ! -d "~/.vim" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# Install plugins
vim +PlugInstall

# Configure other package managers & packages (brew, npm, bash, brek-cask, ruby, python)
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/npm.sh"
. "$DOTFILES_DIR/install/bash.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"
. "$DOTFILES_DIR/install/gem.sh"
. "$DOTFILES_DIR/install/pip.sh"

# Run tests
if is-executable bats; then bats test/*.bats; else echo "Skipped: tests (missing: bats)"; fi

# Install extra stuff
if [ -d "$DOTFILES_EXTRA_DIR" -a -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
  . "$DOTFILES_EXTRA_DIR/install.sh"
fi
