# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>
# You can use `Ctrl+x h` to view current context before completion

# Add custom directory for completion files
fpath=("$XDG_CONFIG_HOME/zsh/completions" $fpath)

# Show hidden files and directories in completion
setopt glob_dots
# Hide completion menu after item was choosen
setopt menu_complete

# Enable completion cache
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

[[ -z "$LS_COLORS" ]] || zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' completer _complete _approximate
# Also try case insensitive match
zstyle ':completion:*' matcher-list '' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
# Enable option descriptions
zstyle ':completion:*' verbose yes

# Expand `//` to `/`, not to `/*/`
zstyle ':completion:*' squeeze-slashes true
# Complete options for commands `cd`, `chdir` and `pushd`
zstyle ':completion:*' complete-options true
# Separate man sections in the completion list
zstyle ':completion:*:manuals' separate-sections true

# Group completions by tags
zstyle ':completion:*' group-name ''
# Show group descriptions
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:corrections' format '[%d - %e error(s)]'
zstyle ':completion:*:messages' format '[%d]'
# Do not show 'no match found'
#zstyle ':completion:*:warnings' format ' %F{black}%K{red}[no match found]%k%f'

# fzf-tab plugin aware settings
if (($zsh_plugins[(Ie)fzf-tab])); then
	zstyle ':completion:*' menu no
else
	zstyle ':completion:*' menu select
	# Sort files by modification time in the completion list
	zstyle ':completion:*' file-sort modification
fi

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

autoload -Uz bashcompinit; bashcompinit
