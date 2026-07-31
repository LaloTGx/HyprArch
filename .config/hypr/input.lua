hl.config({
    input = {
        kb_layout = "us,es",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:alt_space_toggle",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
        },
    },
    cursor = {
        inactive_timeout = 1,
    },
})
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})
hl.gesture({
    fingers = 3,
    direction = "up",
    action = "close",
})
hl.gesture({
    fingers = 3,
    direction = "down",
    action = function() hl.exec_cmd("kitty") end
})
-- Special:Magic
hl.gesture({
    fingers = 2,
    direction = "pinchin",
    action = "workspace",
    params = "special:magic"
})
hl.gesture({
    fingers = 2,
    direction = "pinchout",
    mods = "SUPER",
    action = "special",
    workspace_name = "magic",
})
hl.gesture({
    fingers = 3,
    direction = "pinchout",
    action = "move",
    params = "+0",
})
hl.gesture({
    fingers = 3,
    direction = "pinchin",
    action = function() hl.exec_cmd("kitty -e yazi") end
})
hl.gesture({
    fingers = 4,
    direction = "up",
    action = function() hl.exec_cmd("kitty -e rofi -show drun") end
})
hl.gesture({
    fingers = 4,
    direction = "down",
    action = function() hl.exec_cmd("kitty -e  pkill rofi || ~/.config/rofi/scripts/r_wallpaper/wallpaper-rofi.sh") end
})
hl.gesture({
    fingers = 4,
    direction = "left",
    action = function() hl.exec_cmd("kitty -e  pkill rofi || ~/.config/rofi/scripts/r_menu/quickmenu.sh") end
})
hl.gesture({
    fingers = 4,
    direction = "right",
    action = "dispatcher",
    action = function() hl.exec_cmd("kitty -e  pkill rofi || ~/.config/rofi/scripts/r_remember/rem-picker.sh") end
})
