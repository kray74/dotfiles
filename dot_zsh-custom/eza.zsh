if command -v eza > /dev/null; then
	alias eza='eza -lagM --smart-group --icons=auto --hyperlink --group-directories-first --time-style relative --total-size'
	alias ezag='eza --git --git-ignore'
fi
