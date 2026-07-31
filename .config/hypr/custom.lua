hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 0,
        col = {
            active_border = {
                colors = {
                    "rgba(e6f2ff40)",
                    "rgba(ffffff00)",
                },
                angle = 140,
            },

            inactive_border = "rgba(ffffff00)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 0,
        rounding_power = 0,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        shadow = {
            enabled = false,
            range = 1,
            render_power = 0,
            color = "rgba(ffffffff)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            vibrancy = 0,
        },
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        allow_small_split = true,
        special_scale_factor = 1,
        mfact = 0.58,
        new_status = "slave",
        new_on_top = false,
        new_on_active = "after",
        orientation = "left",
        slave_count_for_center_master = 2,
        center_master_fallback = "left",
        smart_resizing = true,
        drop_at_cursor = false,
        always_keep_position = false,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})
