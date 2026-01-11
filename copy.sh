
echo "run copy"

# copy monitor if it dones exist
if [ ! -f ~/.config/hypr/hyprland/monitors.conf ]; then
    echo "copy monitor"
    mkdir -p ~/.config/hypr/hyprland/
    cp ./config/hypr/hyprland/monitors.conf ~/.config/hypr/hyprland/monitor
fi

# copys all files without monitor
rsync -av --exclude 'hypr/hyprland/monitors.conf' ./config/ ~/.config/

