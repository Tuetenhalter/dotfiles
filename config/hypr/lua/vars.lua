-- Shared variables (formerly $terminal, $fileManager, $menu, $mainMod, $obsidian)

local vars = {}

vars.terminal    = "kitty"
vars.fileManager = "nautilus"
vars.menu        = "pkill rofi || rofi -show combi"

vars.mainMod = "SUPER"

-- focus obsidian when open when not start my default obsidain vault
vars.obsidian = [[hyprctl dispatch focuswindow class:md.obsidian.Obsidian | grep ok || xdg-open "obsidian://open?vault=Obsidian"]]

return vars
