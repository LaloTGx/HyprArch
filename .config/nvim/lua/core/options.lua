-- Opciones básicas de Neovim
vim.opt.number = true            -- Muestra números de línea
vim.opt.relativenumber = false   -- Números relativos (mejor para moverse con hjkl)
vim.opt.tabstop = 4              -- Un tab = 4 espacios
vim.opt.shiftwidth = 4           -- Auto-indentado = 4 espacios
vim.opt.expandtab = true         -- Convierte tabs en espacios
vim.opt.smartindent = true       -- Detecta indentación automáticamente
vim.opt.wrap = false             -- No hacer wrap del texto
vim.opt.cursorline = true        -- Resalta la línea del cursor
vim.opt.termguicolors = true     -- Activa soporte de colores extendido
vim.opt.scrolloff = 8            -- Margen al hacer scroll
vim.opt.signcolumn = "yes"       -- Siempre muestra columna de signos (diagnósticos, etc.)
vim.opt.autowrite = true         -- Auto guardado del archivo modificado si cambias de buffer
vim.opt.timeoutlen = 300         --Reduce el tiempo para que se activen cosas como `which-key`
