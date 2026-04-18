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
      -- Esto se deja vacío o se personaliza si quieres colores específicos
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
  }
}
