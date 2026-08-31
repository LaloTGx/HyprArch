-- Apps
hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("kitty -e ncmpcpp"))
hl.bind("SUPER + EQUAL", hl.dsp.exec_cmd("~/.config/rofi/scripts/r_keyboard/key-picker.sh"))
hl.bind("SUPER + PERIOD",hl.dsp.exec_cmd("~/.config/rofi/scripts/r_emoji/emoji-picker.sh"))
hl.bind("SUPER + SLASH", hl.dsp.exec_cmd("~/.config/rofi/scripts/r_menu/quickmenu.sh"))
hl.bind("SUPER + COMMA", hl.dsp.exec_cmd("~/.config/rofi/scripts/r_wallpaper/wallpaper-rofi.sh"))
hl.bind("SUPER + APOSTROPHE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + SEMICOLON", hl.dsp.exec_cmd("rofi -show window"))
hl.bind("SUPER + MINUS", hl.dsp.exec_cmd("rofi -show filebrowser"))
hl.bind("SUPER + BACKSLASH", hl.dsp.exec_cmd("~/.config/rofi/scripts/r_remember/rem-picker.sh"))
hl.bind("SUPER + G", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/ss$(date +'%Y%m%d-%H%M%S').png | wl-copy"))
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("SUPER + SHIFT + code:201", hl.dsp.exec_cmd("obsidian"))
-- Windows
hl.bind("SUPER + S", hl.dsp.window.close())
hl.bind("SUPER + A", hl.dsp.window.float())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
-- Hyprland (session)
hl.bind("SUPER + ESCAPE", hl.dsp.exit())
hl.bind("SUPER + BACKSPACE", hl.dsp.exec_cmd("shutdown now"))
-- Move focus with mainMod + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "d" }))

for i = 1, 9 do
    -- Move active window to a workspace
    hl.bind("ALT + " .. i, hl.dsp.focus({ workspace = i }))
    -- Switch active window to a workspace
    hl.bind("SUPER + " .. i, hl.dsp.window.move({ workspace = i }))
end
-- Move/Switch workspace to 0
hl.bind("ALT + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + 0", hl.dsp.window.move({ workspace = 10 }))
-- Switch previous and next workspace
hl.bind("ALT + bracketleft",  hl.dsp.focus({ workspace = "r-1" }))
hl.bind("ALT + bracketright", hl.dsp.focus({ workspace = "r+1" }))
-- Move previous and next workspace
hl.bind("SUPER + bracketleft",  hl.dsp.window.move({ workspace = "r-1" }))
hl.bind("SUPER + bracketright", hl.dsp.window.move({ workspace = "r+1" }))
-- Special workspace
hl.bind("ALT + GRAVE", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + GRAVE", hl.dsp.window.move({ workspace = "special:magic" }))
-- Scroll through existing workspaces
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
-- Move/resize Windows
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- Audio: Speakers
hl.bind("SUPER + J", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("SUPER + K", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("SUPER + L", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
-- Audio: Microphone
hl.bind("SUPER + I", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })
hl.bind("SUPER + O", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%-"), { repeating = true })
hl.bind("SUPER + P", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+"), { repeating = true })
-- Playerctl Media
hl.bind("SUPER + B", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("playerctl next"))
-- Bright
hl.bind("SUPER + X", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true })
hl.bind("SUPER + Z", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true })
