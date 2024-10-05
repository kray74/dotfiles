if is_command_exists fzf; then
	eval "$(fzf --zsh)"
	alias fzfbat='fzf --preview "bat --color=always --style=numbers --line-range=:100 {}"'

	function () {
		# Default options
		local _fzf_common_flags=(
			--border --wrap --reverse --info=inline-right --height 100%
			--tabstop=4
			--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
			--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
			--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
			--color=selected-bg:#45475a
		)

		export FZF_DEFAULT_OPTS="$_fzf_common_flags"

		# Directory list options (Alt+C)
		local _fzf_dir_preview="ls -1AF --group-directories-first --color=always"
		if is_command_exists eza; then
			_fzf_dir_preview="eza -1aF --group-directories-first --color=always --icons=always"
		fi

		export FZF_ALT_C_OPTS="--preview \"$_fzf_dir_preview {}\""

		# fzf-tab plugin
		if (($zsh_plugins[(Ie)fzf-tab])); then
			zstyle ':fzf-tab:*' fzf-flags $_fzf_common_flags --cycle --border-label=' F1/F2 - switch group, Ctrl+Space - multi-select, / - continous path completion '
			zstyle ':fzf-tab:complete:cd:*' fzf-preview "$_fzf_dir_preview \$realpath"
		fi
	}

	# Reset Ctrl+r to atuin
	if is_command_exists atuin; then
		bindkey '^r' atuin-search
	fi
fi
