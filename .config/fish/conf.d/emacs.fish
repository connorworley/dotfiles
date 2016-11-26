# Try to connect to server first
function emacs
  command emacsclient "--alternate-editor=emacs" $argv
end
