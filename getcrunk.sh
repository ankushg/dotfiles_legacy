#!/usr/bin/env zsh

# Quit if we have an error
trap 'exit' ERR

# Install command-line utils, apps, fonts
brew bundle ./Brewfile
brew bundle ./Caskfile