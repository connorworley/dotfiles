# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="cloud"
plugins=(git
	 colored-man-pages
	 brew
	 osx
	 rand-quote
	 nyan)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="emacs"
export PATH=$PATH:~/.bin

quote
