return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.o.cmdheight = 0

      local matugen = require("core.matugen").get_colors()
      local c = matugen.colors

      local colors = {
        normal  = c.primary,
        insert  = c.tertiary,
        visual  = c.secondary,
        replace = c.error,
        command = c.primary_container,
        bg      = c.surface,
        fg      = c.on_surface,
        panel   = "#28282800", -- Color de fondo de la barra
      }

      -- En lugar de require("lualine.themes..."), creamos la estructura base nosotros
      -- Esto evita el error de "nil value"
      local custom_theme = {
        normal = {
          a = { fg = colors.bg, bg = colors.normal, gui = 'bold' },
          b = { fg = colors.fg, bg = c.surface_container_high },
          c = { fg = colors.fg, bg = colors.panel }, -- Aquí definimos 'c' con seguridad
        },
        insert  = { a = { fg = colors.bg, bg = colors.insert, gui = 'bold' } },
        visual  = { a = { fg = colors.bg, bg = colors.visual, gui = 'bold' } },
        replace = { a = { fg = colors.bg, bg = colors.replace, gui = 'bold' } },
        command = { a = { fg = colors.bg, bg = colors.command, gui = 'bold' } },
        inactive = {
          a = { fg = colors.fg, bg = colors.bg },
          b = { fg = colors.fg, bg = colors.bg },
          c = { fg = colors.fg, bg = colors.bg },
        },
      }

      -- Copiamos el fondo 'c' a los demás modos para que sea uniforme
      custom_theme.insert.c  = custom_theme.normal.c
      custom_theme.visual.c  = custom_theme.normal.c
      custom_theme.replace.c = custom_theme.normal.c
      custom_theme.command.c = custom_theme.normal.c

      local mode_color = {
        n = { fg = colors.bg, bg = colors.normal },
        i = { fg = colors.bg, bg = colors.insert },
        v = { fg = colors.bg, bg = colors.visual },
        V = { fg = colors.bg, bg = colors.visual },
        c = { fg = colors.bg, bg = colors.command },
        R = { fg = colors.bg, bg = colors.replace },
      }

      require("lualine").setup({
        options = {
          theme = custom_theme, -- Usamos nuestra tabla creada
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = {
            {
              "mode",
              separator = { left = "", right = "" },
              padding = { left = 0, right = 0 },
              color = function()
                local m = vim.fn.mode()
                return mode_color[m] or mode_color["n"]
              end,
            },
          },
          lualine_b = {
            { "filename", path = 1, separator = { right = "" }, color = { bg = c.surface_container_high } },
          },
          lualine_c = {},
          lualine_x = {
            { "encoding", color = { bg = colors.panel, fg = colors.fg } },
            { "fileformat", color = { bg = colors.panel, fg = colors.fg } },
            { "filetype", color = { bg = colors.panel, fg = colors.fg } },
          },
          lualine_y = {
            { "progress", separator = { left = "" }, color = { bg = c.surface_container_high } },
          },
          lualine_z = {
            { "location", separator = { left = "", right = "" }, color = { bg = c.surface_container_highest, fg = colors.fg } },
          },
        },
      })
    end,
  },
}
