#!/bin/sh

DOTFILES="$(pwd)"

# Go and override any .zshrc with my own!
cd $HOME

ln -sf $DOTFILES/_zshrc .zshrc
ln -sf $DOTFILES/_vimrc .vimrc

cd $DOTFILES

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sh -c "$(curl --proto '=https' --tlsv1.2 -sSfL https://sh.rustup.rs)" -- -y

cargo install starship

npm config set prefix '~/.npm-global'
