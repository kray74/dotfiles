if is_command_exists flatpak; then
	alias flatar="flatpak uninstall --unused"
	alias flati="flatpak install"
	alias flatl="flatpak list"
	alias flatr="flatpak run"
	alias flats="flatpak search"
	alias flatu="flatpak update"
fi
