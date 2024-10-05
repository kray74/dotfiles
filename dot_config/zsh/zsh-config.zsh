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

# Set vi style cursors
# '\e[1 q' - blinking block
# '\e[2 q' - non-blinking block
# '\e[3 q' - blinking underscore
# '\e[4 q' - non-blinking underscore
# '\e[5 q' - blinking beam
# '\e[6 q' - non-blinking beam
function zle-keymap-select() {
	if [[ $KEYMAP == vicmd ]]; then
		echo -ne '\e[1 q'
	elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]]; then
		echo -ne '\e[5 q'
	fi
}

function zle-line-init() {
	echo -ne '\e[5 q'
}

zle -N zle-keymap-select
zle -N zle-line-init

# Load custom files
function() {
	local custom
	for custom in "$XDG_CONFIG_HOME"/zsh/custom/*.zsh; do
		source "$custom"
	done
}
