if is_command_exists vivid; then
	export LS_COLORS="$(vivid generate catppuccin-mocha)"

	# redefine zsh completion colors
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
