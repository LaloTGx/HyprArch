local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Cargar todos los archivos en lua/plugins/
local plugins = {}
local plugin_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins", "*.lua", false, true)
for _, file in ipairs(plugin_files) do
  local plugin = dofile(file)
  table.insert(plugins, plugin)
end

require("lazy").setup(plugins)
