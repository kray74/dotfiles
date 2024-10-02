if is_command_exists nvim; then
	alias v=nvim
	alias sv='sudo nvim'

	# see `nvim "+help :Man"`
	export MANPAGER="nvim +Man!"
fi
