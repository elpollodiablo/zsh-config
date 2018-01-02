#!/bin/bash

SCRIPT_DIR=`dirname $0`
FULL_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"

test -f /usr/local/bin/brew && brew install zsh
test -f /usr/bin/apt-get && sudo apt-get install -y zsh zsh-doc

if [[ ! -f /usr/local/bin/zsh ]]; then
	test -e /bin/zsh && sudo ln -s /bin/zsh /usr/local/bin/zsh
	test -e /usr/bin/zsh && sudo ln -s /usr/bin/zsh /usr/local/bin/zsh
	test -e /usr/local/bin/zsh || ( echo omg no zsh; exit 1 );
fi
rm -f ~/.zshrc
ln -s $FULL_DIR/zshrc ~/.zshrc

if [[ ! `grep /usr/local/bin/zsh /etc/shells` ]] ; then
	echo /usr/local/bin/zsh |sudo tee -a /etc/shells
fi
chsh -s /usr/local/bin/zsh

