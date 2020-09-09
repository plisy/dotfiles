#!/bin/sh

if [ -z "$(grep /zsh$ /etc/shells | tail -1)" ]; then
    echo "zsh not installed"

    if [ -n "$(which apt-get)"]; then
        apt-get install zsh -y
    fi
else
    echo "zsh installed"
fi
