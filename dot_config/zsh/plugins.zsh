function () {
	local plugin
	for plugin in $zsh_plugins; do
		local plugin_dir="$XDG_CONFIG_HOME/zsh/plugins/$plugin"
		fpath=("$plugin_dir" $fpath)
		source "$plugin_dir/$plugin.plugin.zsh"
	done
}
