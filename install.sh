


echo "run sudo pacman -Syu"
sudo pacman -Syu



packages=(
	# hyprland 
	hyprland  
	qt5-wayland	
	qt6-wayland
	noto-fonts
	hyprpolkitagent # Authentication Agent
	dunst # notification daemon

	kitty
	dolphin

	# gui
	rofi
	waybar

	# sound
	pipewire
	wireplumber

	#bluetooth
	bluez
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

./copy.sh

