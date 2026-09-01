return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    configs.setup({
      ensure_installed = {
        "python", "java", "rust", "kotlin", "html", "css", "javascript", "typescript", "wgsl", "lua", "vim"
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
