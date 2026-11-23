
echo "run copy"

# copy monitor if it dones exist (Lua config, loaded by hyprland.lua)
if [ ! -f ~/.config/hypr/lua/monitors.lua ]; then
    echo "copy monitor (lua)"
    mkdir -p ~/.config/hypr/lua/
    cp ./config/hypr/lua/monitors.lua ~/.config/hypr/lua/monitors.lua
fi

# copy legacy monitor if it dones exist (fallback hyprland.conf, only used without hyprland.lua)
if [ ! -f ~/.config/hypr/hyprland/monitors.conf ]; then
    echo "copy monitor (legacy)"
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
rsync -av --exclude 'hypr/hyprland/monitors.conf' --exclude 'hypr/lua/monitors.lua' ./config/ ~/.config/


echo "Reload Hyprland"
hyprctl reload
