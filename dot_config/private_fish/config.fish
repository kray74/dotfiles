function is_command_exists
	command -v $argv[1] >/dev/null 2>&1
end

if status is-interactive
	function _fzf_setup
		set -f _fzf_common_flags \
			--border --wrap --reverse --info=inline-right --height 100% \
			--tabstop=4 \
			"--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8" \
			"--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc" \
			"--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8" \
			"--color=selected-bg:#45475a"

		set -f _fzf_dir_preview ls -1AF --group-directories-first --color=always
		if is_command_exists eza
			set -f _fzf_dir_preview eza -1aF --group-directories-first --color=always --icons=always
		end

		set -gx FZF_DEFAULT_OPTS $_fzf_common_flags
		set -gx FZF_ALT_C_OPTS --preview "\"$_fzf_dir_preview {}\""
	end

	# disable greeting message
	set fish_greeting

	# XDG base dir
	set -gx XDG_CONFIG_HOME "$HOME/.config"
	set -gx XDG_CACHE_HOME "$HOME/.cache"
	set -gx XDG_DATA_HOME "$HOME/.local/share"

	# Uncluttering home dir
	set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
	set -gx DOTNET_CLI_HOME "$XDG_DATA_HOME/dotnet"
	set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
	set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"
	set -gx NPM_CONFIG_TMP "$XDG_RUNTIME_DIR/npm"

	# PATH
	fish_add_path -pg "$HOME/.local/bin"
	fish_add_path -pg "$CARGO_HOME/bin"

	# Wayland specific
	set -gx ELECTRON_OZONE_PLATFORM_HINT auto
	set -gx GDK_BACKEND wayland
	set -gx QT_QPA_PLATFORM wayland
	#set -gx SDL_VIDEODRIVER wayland,x11

	# Fuck you nvidia
	set -gx WEBKIT_DISABLE_COMPOSITING_MODE 1

	if is_command_exists nvim
		set -gx EDITOR nvim
		# see `nvim +help :Man`
		set -gx MANPAGER nvim +Man!
	end
	set -gx VISUAL $EDITOR

	if is_command_exists fzf
		_fzf_setup
	end

	if is_command_exists systemctl
		# disable horizontal scroll
		set -gx SYSTEMD_LESS FRXMK
	end
end

if status is-interactive
	set -g fish_key_bindings fish_vi_key_bindings

	if is_command_exists atuin
		atuin init fish | source
	end

	if is_command_exists fzf
		fzf --fish | source

		# Reset c-r to atuin
		if is_command_exists atuin
			bind \cr _atuin_search
			bind -M insert \cr _atuin_search
		end
	end

	if is_command_exists starship
		starship init fish | source
	end

	if is_command_exists chezmoi
		abbr -a --position command cm chezmoi
	end

	if is_command_exists firewall-cmd
		abbr -a --position command fw sudo firewall-cmd
	end

	if [ $TERM = "xterm-kitty" ]
		abbr -a --position command ssh kitten ssh
	end

	if is_command_exists nvim
		abbr -a --position command v nvim
		abbr -a --position command sv sudo nvim
	end

	if is_command_exists systemctl
		abbr -a --position command sc sudo systemctl
		abbr -a --position command scu systemctl --user
	end

	if is_command_exists journalctl
		abbr -a --position command jc journalctl
	end

	if is_command_exists vivid
		set -gx LS_COLORS (vivid generate catppuccin-mocha)
	end
end
