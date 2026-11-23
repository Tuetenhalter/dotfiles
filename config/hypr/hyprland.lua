-- Hyprland Lua config (entry point)
-- Loaded instead of hyprland.conf whenever this file exists (Hyprland >= 0.56).
-- The legacy hyprland.conf is kept as a fallback: delete/rename this file to use it.
-- API stubs: /usr/share/hypr/stubs/hl.meta.lua
-- Wiki: https://wiki.hypr.land/Configuring/Start/

-- Modules (lua/*.lua, resolved relative to ~/.config/hypr/)
require("lua.monitors")
require("lua.autostart")
require("lua.env")
require("lua.settings")
require("lua.keybinds")
require("lua.rules")
