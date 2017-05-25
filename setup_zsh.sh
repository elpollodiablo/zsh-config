#!/bin/bash

SCRIPT_DIR=`dirname $0`
FULL_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"

rm -f ~/.zshrc
ln -s $FULL_DIR/zshrc ~/.zshrc

test "`which zsh`" && which zsh > ~/.profile
