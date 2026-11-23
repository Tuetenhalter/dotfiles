# dotfiles

moin

test

## Hyprland

Config is Lua (Hyprland >= 0.56): `config/hypr/hyprland.lua` is the entry point and
requires the modules in `config/hypr/lua/` (`vars`, `monitors`, `autostart`, `env`,
`settings`, `keybinds`, `rules`). Hyprland prefers `hyprland.lua` over `hyprland.conf`;
the legacy `hyprland.conf` + `hyprland/*.conf` are kept as a fallback.

`lua/monitors.lua` is machine-local: `copy.sh` only installs it if missing and never overwrites it.

Check the config with `Hyprland --verify-config -c ~/.config/hypr/hyprland.lua`
(note: this also runs the top-level `killall waybar ; waybar`).
