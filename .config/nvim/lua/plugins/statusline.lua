return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.o.cmdheight = 0 -- Oculta la línea de comandos

      local colors = {
        normal = "#a89984",
        insert = "#b8bb26",
        visual = "#fabd2f",
        replace = "#fb4934",
        command = "#83a598",
        bg = "#1d2021",
        fg = "#ebdbb2",
      }

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
          theme = "gruvbox",
          component_separators = "",
          section_separators = "",
        },
        sections = {
          -- Bloque izquierdo
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
            { "filename", path = 1, separator = { right = "" } },
          },
          -- Centro vacío
          lualine_c = { function() return "" end },
          -- Bloque derecho
          lualine_x = {
            { "encoding", separator = { left = "" } },
            { "fileformat", separator = { left = "" } },
            { "filetype", separator = { left = "" } },
          },
          lualine_y = {
            { "progress", separator = { left = "" } },
          },
          lualine_z = {
            { "location", separator = { left = "", right = "" } },
          },
        },
        inactive_sections = { -- Para cuando la ventana no está activa
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}

