------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

-- Ref https://wiki.hypr.land/Configuring/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ name = "no-gaps-wtv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
-- hl.window_rule({ name = "no-gaps-f1",   match = { float = false, workspace = "f[1]" },   border_size = 0, rounding = 0 })

-- Fix some dragging issues with XWayland
-- hl.window_rule({
--     name  = "fix-xwayland-drags",
--     match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_focus = true,
-- })

hl.window_rule({
    name  = "titansoul",
    match = { class = "steam_app_297130" },

    -- legacy: "2 *"  (Lua parser rejects "*"; -1 = leave client state unchanged)
    fullscreen_state = "2 -1",
})

hl.window_rule({
    name  = "Warcraft3",
    match = { class = "war3.exe" },

    fullscreen_state = "2 2",
})

hl.window_rule({
    name  = "PEAK",
    match = { class = "steam_app_3527290" },

    workspace = "2",
})

-- hl.window_rule({
--     name  = "Steam",
--     match = { class = "steam" },
--
--     float = false,
-- })
