if status is-interactive
    abbr -a --position command dnfu sudo dnf upgrade
    abbr -a --position command dnfunw sudo dnf upgrade --setopt=install_weak_deps=False
    abbr -a --position command dnfi sudo dnf install
    abbr -a --position command dnfinw sudo dnf install --setopt=install_weak_deps=False
end
