#! /bin/sh

DOTFILES="$( cd "$(dirname "$0")" ; pwd -P )"

echo "Context: DOTFILES=${DOTFILES}"

# # Create locals override file so my .zshrc doesn't complain
# touch ~/.locals

sh $DOTFILES/install-zsh.sh

echo "Setting up git preferences"
sh $DOTFILES/configure-git.sh

# # Go and override any .zshrc with my own!
# cd $HOME

# echo "Linking config files"
ln -sf $DOTFILES/_zshrc.d $HOME/.zshrc.d
ln -sf $DOTFILES/_zshrc $HOME/.zshrc

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
   brew bundle
fi