# Command to quickly reload config
function rehash
  source ~/.config/fish/conf.d/*.fish
end

function fish_greeting
end

set -U fish_user_paths $fish_user_paths ~/.bin

function emacs
  command emacsclient "--alternate-editor=emacs" "$argv"
end

function fish_prompt
  echo -n (date "+[%H:%M:%S]")' '
  if [ "$SSH_TTY" ]
    set_color --bold red
    echo -n (whoami)'@'(hostname)':'
  end
  set_color --bold green
  echo -n (string replace "$HOME" '~' (pwd))' '
  set_color normal
end

# Manpage colorization
function man
  set LESS_TERMCAP_md (set_color --bold red)
  set LESS_TERMCAP_me (set_color normal)
  set LESS_TERMCAP_se (set_color normal)
  set LESS_TERMCAP_so (set_color --background blue yellow)
  set LESS_TERMCAP_ue (set_color normal)
  set LESS_TERMCAP_us (set_color --bold green)
  command man "$argv"
end

function ls_color
  switch "$argv"
    case 'black'
      echo 'a'
    case 'red'
      echo 'b'
    case 'green'
      echo 'c'
    case 'yellow'
      echo 'd'
    case 'blue'
      echo 'e'
    case 'magenta'
      echo 'f'
    case 'cyan'
      echo 'g'
    case 'light grey'
      echo 'h'
    case 'normal'
      echo 'x'
  end
end

function ls_color_bold
  echo (ls_color "$argv" | awk '{print toupper($0)}')
end

# directory
set -x LSCOLORS (ls_color_bold 'blue')(ls_color 'normal')
# symlink
set -x LSCOLORS $LSCOLORS(ls_color_bold 'cyan')(ls_color 'normal')
# socket
set -x LSCOLORS $LSCOLORS(ls_color 'magenta')(ls_color 'normal')
# pipe
set -x LSCOLORS $LSCOLORS(ls_color 'black')(ls_color_bold 'light grey')
# executable
set -x LSCOLORS $LSCOLORS(ls_color_bold 'red')(ls_color 'normal')
# block
set -x LSCOLORS $LSCOLORS(ls_color_bold 'green')(ls_color 'normal')
# character
set -x LSCOLORS $LSCOLORS(ls_color_bold 'yellow')(ls_color 'normal')
# executable with setuid bit set
set -x LSCOLORS $LSCOLORS(ls_color 'black')(ls_color 'red')
# executable with setgid bit set
set -x LSCOLORS $LSCOLORS(ls_color 'black')(ls_color 'cyan')
# directory writable to others, with sticky bit
set -x LSCOLORS $LSCOLORS(ls_color 'black')(ls_color 'green')
# directory writable to others, without sticky bit 
set -x LSCOLORS $LSCOLORS(ls_color 'black')(ls_color 'yellow')

set fish_color_autosuggestion 555\x1eyellow
set fish_color_command 005fd7\x1epurple
set fish_color_comment red
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end green
set fish_color_error red\x1e\x2d\x2dbold
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host normal
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param 00afff\x1ecyan
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_selection \x2d\x2dbackground\x3dpurple
set fish_color_user green
set fish_color_valid_path \x2d\x2dunderline
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan
