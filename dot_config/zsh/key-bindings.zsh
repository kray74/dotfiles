if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start() { echoti smkx }
	function zle_application_mode_stop() { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Page Up, Page Down
[[ -n "${terminfo[kpp]}" ]] && bindkey -- "${terminfo[kpp]}" up-line-or-history
[[ -n "${terminfo[knp]}" ]] && bindkey -- "${terminfo[knp]}" down-line-or-history

# Home, End
[[ -n "${terminfo[khome]}" ]] && bindkey -- "${terminfo[khome]}" beginning-of-line
[[ -n "${terminfo[kend]}" ]] && bindkey -- "${terminfo[kend]}" end-of-line

# Backspace, Delete
[[ -n "${terminfo[kbs]}" ]] && bindkey -- "${terminfo[kbs]}" backward-delete-char
[[ -n "${terminfo[kdch1]}" ]] && bindkey -- "${terminfo[kdch1]}" delete-char

# Ctrl+Left, Ctrl+Right
[[ -n "${terminfo[kLFT5]}" ]] && bindkey -- "${terminfo[kLFT5]}" backward-word
[[ -n "${terminfo[kRIT5]}" ]] && bindkey -- "${terminfo[kRIT5]}" forward-word

# Shift+Tab
[[ -n "${terminfo[kcbt]}" ]] && bindkey -- "${terminfo[kcbt]}" reverse-menu-complete

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
