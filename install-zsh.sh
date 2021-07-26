#!/bin/sh

if [ -z "$(grep /zsh$ /etc/shells | tail -1)" ]; then
    echo "zsh not installed"

    if [ -n "$(which apt-get)"]; then
        apt-get install zsh -y
    fi
fi

# Add oh-my-zsh
if [[ -z "${ZSH}" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Common theme
curl https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme --output ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/common.zsh-theme --silent

# Autosuggestions
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
