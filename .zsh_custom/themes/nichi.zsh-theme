PROMPT='%{$fg_bold[green]%}%c %{$reset_color%}$(git_prompt_info) %{$reset_color%}'
if [[ -n "$SSH_TTY" ]]; then
   PROMPT='%{$fg_bold[red]%}%n@%m:'$PROMPT
fi
PROMPT='[%*] '$PROMPT
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}(dirty)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""