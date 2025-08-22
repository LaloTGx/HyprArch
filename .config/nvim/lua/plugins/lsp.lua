return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Inicia Mason
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "marksman", -- Markdown
          "ts_ls", -- JavaScript / TypeScript
          "html",     -- HTML
          "cssls",    -- CSS
          "jdtls",    -- Java
          "pyright",  -- Python
        }
      })

      -- Configuración de cada LSP
      local lspconfig = require("lspconfig")
      local servers = { "marksman", "ts_ls", "html", "cssls", "jdtls", "pyright" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
      end
    end,
  },
}

