#!/usr/bin/env zsh

# Quit if we have an error
trap 'exit' ERR

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install command-line utils, apps, fonts
brew install $(cat ./Brewfile |grep -v "#")

# Install homebrew cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install $(cat ./Caskfile |grep -v "#")


brew tap tap caskroom/fonts
brew cask install $(cat ./Fontfile |grep -v "#")

brew cleanup
brew cask cleanup
brew linkapps