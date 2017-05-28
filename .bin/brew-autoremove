#!/usr/bin/env fish

set -l visited_formulas 'brew-cask'

function check_formulas
  for formula in $argv
    set -l dependees (brew uses --installed $formula)
	  if [ -z "$dependees" ]; and \
      not contains $formula $visited_formulas 
	    read -p "echo \"$formula is not depended on by other formulas. Remove? [Y/n] \"" -l input
	    set visited_formulas $visited_formulas $formula
	    if [ "$input" = "Y" ]
		    brew remove $formula
		    check_formulas (brew deps --1 --installed $formula)
	    end
    end
  end
end

echo "Searching for formulas not depended on by other formulas..."

check_formulas (brew list)
