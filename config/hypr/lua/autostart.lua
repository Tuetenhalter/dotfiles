-----------------
--- AUTOSTART ---
-----------------

-- exec-once: runs only when Hyprland starts
hl.on("hyprland.start", function()
    hl.exec_cmd("discord --start-minimized", { workspace = "10 silent" })
    -- hl.exec_cmd("firefox")

    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hyprctl setcursor Adwaita 12")

    -- clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data

    hl.exec_cmd("wvkbd-mobintl -L 400 --hidden")
end)

-- exec: top-level code runs on every config (re)load
-- (re)start waybar -- this is also the initial start, so no waybar in hyprland.start
hl.exec_cmd("killall waybar ; waybar")
