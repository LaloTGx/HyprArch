--# LAYER RULES  #
-- Waybar blur
hl.layer_rule({
    match = {
        namespace = "waybar"
    },
    blur = true
})
-- Rofi blur
hl.layer_rule({
    match = {
        namespace = "rofi"
    },
    blur = true
})
-- Notifications blur
hl.layer_rule({
    match = {
        namespace = "notifications"
    },
    blur = true
})
--# WINDOW RULES #
-- Disable maximize event
hl.window_rule({
    match = {
        class = ".*"
    },
    suppress_event = "maximize"
})
-- Firefox no blur
hl.window_rule({
    match = {
        class = "firefox"
    },
    no_blur = true
})
-- Minecraft launcher no blur
hl.window_rule({
    match = {
        class = "minecraft-launcher"
    },
    no_blur = true
})
-- Steam no blur
hl.window_rule({
    match = {
        class = "steam"
    },
    no_blur = true
})
-- Discord no blur
hl.window_rule({
    match = {
        class = "discord"
    },
    no_blur = true
})
-- OBS no blur
hl.window_rule({
    match = {
        class = "obs-studio"
    },
    no_blur = true
})
