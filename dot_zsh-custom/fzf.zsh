if command -v fzf > /dev/null; then
	alias fzfbat='fzf --preview "bat --color=always --style=numbers --line-range=:100 {}"'
fi
