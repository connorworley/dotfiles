autoload -Uz colors && colors
PROMPT="%{$fg_bold[green]%}%c %{$reset_color%}"
if [[ -n "$SSH_TTY" ]]; then
   PROMPT="%{$fg_bold[red]%}%n@%m:$PROMPT"
fi
export PROMPT="[%*] $PROMPT"
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'

export EDITOR='emacs'
export PATH="$PATH:$HOME/.bin"
