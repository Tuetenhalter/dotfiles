-------------------
--- KEYBINDINGS ---
-------------------

local v = require("lua.vars")
local mainMod = v.mainMod

local function exec(cmd) return hl.dsp.exec_cmd(cmd) end

-- my input  (bindr: fires on release)
hl.bind("SUPER + SUPER_L", exec(v.menu), { release = true })

-- clipboard history
hl.bind("SUPER + V", exec("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

-- application
hl.bind(mainMod .. " + E", exec(v.fileManager))

-- focus obsidian when open when not start my default obsidain vault
hl.bind("SUPER + O", exec(v.obsidian))



hl.bind(mainMod .. " + RETURN",    exec(v.terminal))
hl.bind(mainMod .. " + Q",         hl.dsp.window.close()) -- killactive
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())  -- forcekillactive
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle

hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
-- hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window with shift mainMod + arrow
-- hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
-- hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" })) -- this dosnt work my keyboard ist dum
-- hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
-- hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
-- hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
-- hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- alt tab to change window
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())


-- chagen Workspace with STRG + left, right
hl.bind(mainMod .. " + CONTROL + left",  hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + CONTROL + right", hl.dsp.focus({ workspace = "+1" }))

hl.bind(mainMod .. " + CONTROL + h", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + CONTROL + l", hl.dsp.focus({ workspace = "+1" }))


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging  (bindm)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness  (bindel: locked + repeating)
local el = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume",  exec("pactl set-sink-volume @DEFAULT_SINK@ +5%"), el)
hl.bind("XF86AudioLowerVolume",  exec("pactl set-sink-volume @DEFAULT_SINK@ -5%"), el)
hl.bind("XF86AudioMute",         exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), el)
hl.bind("XF86AudioMicMute",      exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), el)
hl.bind("XF86MonBrightnessUp",   exec("brightnessctl -e4 -n0 set 5%+"), el)
hl.bind("XF86MonBrightnessDown", exec("brightnessctl -e4 -n0 set 5%-"), el)

-- Requires playerctl  (bindl: locked)
hl.bind("XF86AudioNext",  exec("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", exec("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  exec("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  exec("playerctl previous"),   { locked = true })


-- OBS

hl.bind(mainMod .. " + F12", exec("obs-cmd replay save"))



-- toggle mute
hl.bind(mainMod .. " + H", exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

-- screenshot

hl.bind("print",           exec([[pkill slurp || grim -g "$(slurp -c 00000000)" - | wl-copy]]))
hl.bind("CONTROL + print", exec([[pkill slurp || grim -g "$(slurp -c 00000000)" - | swappy -f -]]))
