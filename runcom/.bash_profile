#!/bin/bash

# bash_profile

# set 256 color profile where possible
if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM=xterm-256color
fi

# Up-front dotfiles configuration
# Not part of `load_dotfiles` because it must be sourced before anything else
# to be sure that commands like `brew` (when installed in a custom location)
# are already added to the PATH.
[ -r $HOME/.dotfilesrc ] && source $HOME/.dotfilesrc;

load_dotfiles() {
    declare -a files=(
        $HOME/.bash_options # Options
        $HOME/.bash_exports # Exports
        $HOME/.bash_aliases # Aliases
        $HOME/.bash_prompt # Custom bash prompt
        $HOME/.bash_paths # Path modifications
        $(brew --prefix)/etc/bash_completion # Bash completion (installed via Homebrew)
        $HOME/.bash_profile.local # Local and private settings not under version control (e.g. git credentials)
    	$HOME/Dev/Scripts/git-completion.bash
    )

    # if these files are readable, source them
    for index in ${!files[*]}
    do
        if [[ -r ${files[$index]} ]]; then
            source ${files[$index]}
        fi
    done
}

load_dotfiles
unset load_dotfiles

# Archey
archey -c
