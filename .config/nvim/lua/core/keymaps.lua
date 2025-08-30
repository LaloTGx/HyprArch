-- La tecla "leader" (Espace) main modifier
vim.g.mapleader = " "
-- Explorador de archivos nativo
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Binds básicos
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Cerrar ventana" })
vim.keymap.set("n", "<leader>x", ":wq<CR>", { desc = "Guardar y salir del archivo" })
vim.keymap.set("n", "<leader>z", ":q!<CR>", { desc = "Cerrar forzado" })
-- Movimiento
vim.keymap.set("n", "<A-w>", "k") -- Alt+w → arriba
vim.keymap.set("n", "<A-s>", "j") -- Alt+s → abajo
vim.keymap.set("n", "<A-a>", "h") -- Alt+a → izquierda
vim.keymap.set("n", "<A-d>", "l") -- Alt+d → derecha
-- Da formato al archivo actual con Prettier
vim.keymap.set("n", "<leader>f", ":!prettier --write %<CR>", { desc = "Formatear con Prettier" })
