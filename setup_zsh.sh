#!/bin/bash

SCRIPT_DIR=`dirname $0`
FULL_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"

test -f /usr/local/bin/brew && brew install zsh
test -f /usr/bin/apt-get && sudo apt-get install -y zsh zsh-doc

rm -f ~/.zshrc
ln -s $FULL_DIR/zshrc ~/.zshrc

test "`which zsh`" && which zsh > ~/.profile
