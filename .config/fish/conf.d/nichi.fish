# Command to quickly reload config
function rehash
  source ~/.config/fish/conf.d/*.fish
end

function fish_greeting
end

set -U fish_user_paths $fish_user_paths ~/.bin

function emacs
  command emacs "-nw" "$argv"
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

