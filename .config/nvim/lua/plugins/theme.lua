return {
    "catppuccin/nvim",
    name = "matugen-theme",

    config = function()
        local matugen = require("core.matugen").get_colors()
        local c = matugen.colors

        vim.opt.termguicolors = true
        local hl = vim.api.nvim_set_hl

        -- UI
        hl(0, "Normal", { fg = c.on_surface, bg = c.surface })
        hl(0, "CursorLine", { bg = c.surface_container })
        hl(0, "LineNr", { fg = c.outline })

        -- Legacy syntax
        hl(0, "Comment", { fg = c.outline, italic = true })
        hl(0, "Keyword", { fg = c.primary, bold = true })
        hl(0, "Function", { fg = c.primary_fixed or c.primary })
        hl(0, "String", { fg = c.tertiary })

        -- Treesitter
        hl(0, "@comment", { fg = c.outline, italic = true })
        hl(0, "@keyword", { fg = c.primary, bold = true })
        hl(0, "@function", { fg = c.primary_fixed or c.primary })
        hl(0, "@string", { fg = c.tertiary })
        hl(0, "@type", { fg = c.secondary })
        hl(0, "@number", { fg = c.error })
        hl(0, "@operator", { fg = c.on_surface })
        hl(0, "@punctuation", { fg = c.outline })

        -- Cursor
        hl(0, "Cursor", { fg = c.surface, bg = c.primary })
        hl(0, "CursorInsert", { fg = c.surface, bg = c.tertiary })
        hl(0, "CursorVisual", { fg = c.surface, bg = c.secondary })

        vim.opt.guicursor = {
            "n-c:block-Cursor",
            "v:block-CursorVisual",
            "i-ci-ve:ver25-CursorInsert",
            "r-cr:hor20-CursorReplace",
            "a:blinkwait700-blinkoff500-blinkon500",
        }
    end,
}
