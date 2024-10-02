function is_command_exists() {
	command -v "$1" >/dev/null 2>&1
}

source "$XDG_CONFIG_HOME/zsh/key-bindings.zsh"
source "$XDG_CONFIG_HOME/zsh/compinit.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins.zsh"

# Enable directory stack population (use with cd -`tab`)
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Load custom files
function() {
	local custom
	for custom in "$XDG_CONFIG_HOME"/zsh/custom/*.zsh; do
		source "$custom"
	done
}
