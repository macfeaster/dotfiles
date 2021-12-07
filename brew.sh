#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update Homebrew
brew update

# Install apps
brew install fish
sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

brew install postgresql

brew install --cask alfred
brew install --cask chrome
brew install --cask "sublime-text"
brew install --cask vlc
brew install --cask intellij-idea
brew install --cask slack
brew install --cask flux
