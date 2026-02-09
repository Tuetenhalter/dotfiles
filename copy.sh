

ZSH_THEME="af-magic"


echo "run copy"

# copy monitor if it dones exist
if [ ! -f ~/.config/hypr/hyprland/monitors.conf ]; then
    echo "copy monitor"
    mkdir -p ~/.config/hypr/hyprland/
    cp ./config/hypr/hyprland/monitors.conf ~/.config/hypr/hyprland/monitors.conf
fi

if [ ! -f ~/.zprofile ]; then
    echo "copy zprofile"
    cp ./zprofile ~/.zprofile
fi

# Use 'sed' to find the ZSH_THEME line and replace the value
sed -i "s/^ZSH_THEME=.*/ZSH_THEME=\"$ZSH_THEME\"/" ~/.zshrc

# copys all files without monitor
rsync -av --exclude 'hypr/hyprland/monitors.conf' ./config/ ~/.config/


echo "Reload Hyprland"
hyprctl reload
