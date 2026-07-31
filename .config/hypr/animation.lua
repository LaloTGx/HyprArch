--# BEZIER #
hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        {0.23, 1},
        {0.32, 1}
    }
})
hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        {0.65, 0.05},
        {0.36, 1}
    }
})
hl.curve("linear", {
    type = "bezier",
    points = {
        {0, 0},
        {1, 1}
    }
})
hl.curve("almostLinear", {
    type = "bezier",
    points = {
        {0.5, 0.5},
        {0.75, 1}
    }
})
hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0},
        {0.1, 1}
    }
})
-- Workspaces
hl.curve("easeOutBack", {
    type = "bezier",
    points = {
        {0.1, -0.1},
        {0, 1.2}
    }
})
hl.curve("softBounceOut", {
    type = "bezier",
    points = {
        {0.1, 1},
        {-0.1, 1.2}
    }
})
-- Windows
hl.curve("popIn", {
    type = "bezier",
    points = {
        {0.27, -0.05},
        {0.26, 0.59}
    }
})
hl.curve("pop", {
    type = "bezier",
    points = {
        {0.3, -0.32},
        {0.67, 1.28}
    }
})
hl.curve("popOut", {
    type = "bezier",
    points = {
        {0.13, 0.08},
        {0.52, 0.63}
    }
})
--# ANIMATIONS #
-- Global
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default"
})
-- Border
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint"
})
-- Windows
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 2.8,
    bezier = "popIn"
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 2.8,
    bezier = "pop",
    style = "slide top"
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2.8,
    bezier = "popOut",
    style = "slide top"
})
-- Fade
hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear"
})
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear"
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick"
})
-- Layers
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint"
})
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade"
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade"
})
-- Fade Layers
hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear"
})
hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear"
})
-- Workspaces
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "easeOutBack"
})
hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 5,
    bezier = "softBounceOut"
})
hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 3,
    bezier = "easeOutBack"
})
