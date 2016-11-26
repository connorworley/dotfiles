# Manpage colorization
function man
  set LESS_TERMCAP_md (set_color --bold red)
  set LESS_TERMCAP_me (set_color normal)
  set LESS_TERMCAP_se (set_color normal)
  set LESS_TERMCAP_so (set_color --background blue yellow)
  set LESS_TERMCAP_ue (set_color normal)
  set LESS_TERMCAP_us (set_color --bold green)
  command man $argv
end
