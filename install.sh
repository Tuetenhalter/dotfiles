


echo "run sudo pacman -Syu"
sudo pacman -Syu



packages=(
	# hyprland 
	hyprland  
	qt5-wayland	
	qt6-wayland
	noto-fonts
	dunst # notification daemon

	# gui
	rofi
	waybar

	# sound
	pipewire
	wireplumber

	#bluetooth
	bluz
	bluez-utils
	bluetui

	#insterntet
	nm-connection-editor

	# application
	vim 
	steam
	firefox
	discord
)

echo
echo 
echo "run sudo pacman -S ${packages[@]}"
echo 

sudo pacman -S "${packages[@]}"

