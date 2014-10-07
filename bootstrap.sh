#!/usr/bin/env bash

# Quit if we have an error
trap 'exit' ERR

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;


###
# functions
###
function installed() {
	hash $1 &> /dev/null;
}

function doIt() {
	rsync -avhO --no-perms home/ ~;
}

# Copy dotfiles to home
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# Install Homebrew
if ! installed brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
unset installed;

# oh-my-zsh
if ! [[ -d ~/.oh-my-zsh ]]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# copy over custom zsh aliases, exports, etc
rsync -avhO --no-perms zsh/ $ZSH_CUSTOM/;

#install apps, command-line utils 
./getcrunk.sh

# OSX defaults
# should always be run last as it will shut down Terminal
~/.osx