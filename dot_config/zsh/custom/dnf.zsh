if is_command_exists dnf; then
	alias dnfl="dnf list"
	alias dnfli="dnf list --installed"
	alias dnfs="dnf search"
	alias dnfwr="dnf repoquery --installed --whatrequires "
	alias dnfi="sudo dnf install"
	alias dnfr="sudo dnf remove"
	alias dnfar="sudo dnf autoremove"
	alias dnfu="sudo dnf upgrade --refresh"
	alias dnfunw="sudo dnf upgrade --refresh --setopt=install_weak_deps=False"
	alias dnfup="sudo dnf upgrade --refresh --best --allowerasing"
fi

if is_command_exists dnf5; then
	alias dnfcl="dnf5 changelog --count=1"
fi
