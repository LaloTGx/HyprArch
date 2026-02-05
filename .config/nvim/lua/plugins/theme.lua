return {
    "catppuccin/nvim", -- Usamos un plugin vacío o cualquiera solo para disparar el config
    name = "matugen-theme",
    config = function()
        local matugen = require("core.matugen").get_colors()
        local c = matugen.colors

        vim.opt.termguicolors = true
        local hl = vim.api.nvim_set_hl

        -- Interfaz básica
        hl(0, "Normal", { fg = c.on_surface, bg = c.surface })
        hl(0, "CursorLine", { bg = c.surface_container })
        hl(0, "LineNr", { fg = c.outline })

        -- Sintaxis (Acomoda los nombres según el JSON de Matugen)
        hl(0, "Comment", { fg = c.outline, italic = true })
        hl(0, "Keyword", { fg = c.primary, bold = true })
        hl(0, "Function", { fg = c.primary_fixed or c.primary })
        hl(0, "String", { fg = c.tertiary })
    end,
}
