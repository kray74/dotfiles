if status is-interactive
    # disable greeting message
    set fish_greeting

    # vi keys
    set -g fish_key_bindings fish_vi_key_bindings
    bind -M insert \cf accept-autosuggestion
    bind -M insert delete delete-char

    # default editor
    if command -v nvim >/dev/null 2>&1
        set -gx VISUAL nvim
        # see `nvim +help :Man`
        set -gx MANPAGER nvim +Man!
    else if command -v vim >/dev/null 2>&1
        set -gx VISUAL vim
    else if command -v vi >/dev/null 2>&1
        set -gx VISUAL vi
    end
    set -gx EDITOR $VISUAL

    # disable horizontal scroll in systemd utilities
    set -gx SYSTEMD_LESS FRXMK

    if command -v zoxide >/dev/null 2>&1
        zoxide init fish | source
    end

    if command -v starship >/dev/null 2>&1
        starship init fish | source
    end

    if command -v fzf >/dev/null 2>&1
        set -gx FZF_DEFAULT_OPTS --tabstop=4 \
            --walker-skip .git \
            --border --wrap --reverse --info=inline-right --height 100% \
            "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8" \
            "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc" \
            "--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8" \
            "--color=selected-bg:#45475a"

        if command -v eza >/dev/null 2>&1
            set -gx FZF_ALT_C_OPTS --preview \"eza -1aF --group-directories-first --color=always --icons=always {}\"
        else
            set -gx FZF_ALT_C_OPTS --preview \"ls -1AF --group-directories-first --color=always {}\"
        end

        fzf --fish | source
    end

    abbr -a --position command v $VISUAL
    abbr -a --position command sv sudo $VISUAL
    abbr -a --position command sc sudo systemctl
    abbr -a --position command scu systemctl --user
    abbr -a --position command jc journalctl
    abbr -a --position command fw sudo firewall-cmd
    abbr -a --position command cm chezmoi
end
