#! /bin/sh

DOTFILES="$( cd "$(dirname "$0")" ; pwd -P )"

echo "Context: DOTFILES=${DOTFILES}"

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
   brew bundle
fi

sh $DOTFILES/install-zsh.sh

echo "Setting up git preferences"
sh $DOTFILES/configure-git.sh

# # Go and override any .zshrc with my own!
# cd $HOME

# echo "Linking config files"
ln -sf $DOTFILES/_zshrc.d $HOME/.zshrc.d
ln -sf $DOTFILES/_zshrc $HOME/.zshrc
