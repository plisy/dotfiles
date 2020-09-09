#! /bin/sh

DOTFILES="$( cd "$(dirname "$0")" ; pwd -P )"

echo "Context: DOTFILES=${DOTFILES}"

# Create locals override file so my .zshrc doesn't complain
touch ~/.locals

sh $DOTFILES/install-zsh.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/pkulev/zsh-rustup-completion.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/rustup
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Setting npm prefix to $HOME/.npm-global"
npm config set prefix '~/.npm-global'

echo "Setting up git preferences"
sh $DOTFILES/configure-git.sh

# Go and override any .zshrc with my own!
cd $HOME

echo "Linking config files"
ln -sf $DOTFILES/_zshrc .zshrc
ln -sf $DOTFILES/_vimrc .vimrc
ln -sf $DOTFILES/_cloudenv-settings.json .cloudenv-settings.json

cd $DOTFILES

sh -c "$(curl --proto '=https' --tlsv1.2 -sSfL https://sh.rustup.rs)" -- -y
export PATH="$HOME/.cargo/bin:$PATH"

cargo install starship
