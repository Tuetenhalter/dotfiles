

ZSH_THEME="af-magic"


echo "run copy"

# copy monitor if it dones exist
if [ ! -f ~/.config/hypr/hyprland/monitors.conf ]; then
    echo "copy monitor"
    mkdir -p ~/.config/hypr/hyprland/
    cp ./config/hypr/hyprland/monitors.conf ~/.config/hypr/hyprland/monitors.conf
fi

# copy zprofile if it dones exist
if [ ! -f ~/.zprofile ]; then
    echo "copy zprofile"
    cp ./zprofile ~/.zprofile
fi


# copy zshrc
echo
echo copy zshrc
rsync -av zshrc ~/.zshrc


# copys all files without monitor
echo
echo copy all file without monitor
rsync -av --exclude 'hypr/hyprland/monitors.conf' ./config/ ~/.config/


echo "Reload Hyprland"
hyprctl reload
