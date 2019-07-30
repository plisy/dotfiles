#!/bin/sh

[ -d "~/.oh-my-zsh" ] && ln -sf .zshrc ~
[ -d "~/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
