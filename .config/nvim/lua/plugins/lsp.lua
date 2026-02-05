return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")

      local servers = { "marksman", "ts_ls", "html", "cssls", "jdtls", "pyright" }

      mason_lspconfig.setup({
        ensure_installed = servers,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- MIGRACIÓN A 0.11:
      for _, server in ipairs(servers) do
        -- 1. Configuramos el servidor en el core de Neovim
        vim.lsp.config(server, {
          capabilities = capabilities,
        })

        -- 2. Lo "encendemos" (esto reemplaza al .setup({}))
        vim.lsp.enable(server)
      end
    end,
  },
}
