return {
  -- Líneas verticales de indentación
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = true, show_start = true },
    },
  },

  -- Autopairs: Cierra (), {}, [], etc.
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  -- Rainbow Delimiters: Colorea las llaves por niveles
  {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('rainbow-delimiters.setup').setup({})
    end
  },

  -- Autotag: Cierra etiquetas HTML/JSX automáticamente
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },

  -- Nvim-treesitter-context: saber en qué función o bucle estás metido
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {
      enable = true,
      max_lines = 3,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
    }
  },

  -- Trouble: Lista de errores y warnings con estilo
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    },
  },
}
