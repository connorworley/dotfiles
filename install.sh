#!/bin/sh
mv .zshrc .zshrc.original
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm .zshrc
mv .zshrc.original .zshrc
rm install.sh
killall zsh
zsh
