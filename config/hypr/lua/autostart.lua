-----------------
--- AUTOSTART ---
-----------------

-- exec-once: runs only when Hyprland starts
hl.on("hyprland.start", function()
    hl.exec_cmd("discord --start-minimized", { workspace = "10 silent" })
    -- hl.exec_cmd("firefox")

    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprctl setcursor Adwaita 12")

    -- clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data

    hl.exec_cmd("wvkbd-mobintl -L 400 --hidden")
end)

-- restart waybar on config reload
-- (not top-level: that runs while Hyprland is still initializing, before
-- waybar can connect, so the first start lives in hyprland.start above)
hl.on("config.reloaded", function()
    hl.exec_cmd("killall waybar ; waybar")
end)
