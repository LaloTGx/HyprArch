-- Guardado automatico (solo cuando sale del buffer o del insert)
vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertLeave"}, {
  pattern = "*",
  command = "silent! wall"
})
-- Resalta el texto copeado
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
-- Quitar espacios en blanco al guardar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[:%s/\s\+$//e]],
})
-- Volver en el punto donde deje el cursor
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
-- Ejecucion rapida dependiendo del lenguaje
vim.api.nvim_create_user_command("Run", function()
  local ft = vim.bo.filetype
  if ft == "python" then
    vim.cmd("!python3 %")
  elseif ft == "lua" then
    vim.cmd("luafile %")
  elseif ft == "cpp" then
    vim.cmd("!g++ % -o %:r && ./%:r")
  elseif ft == "java" then
    vim.cmd("!javac % && java %:r")
  else
    print("Lenguaje no soportado: " .. ft)
  end
end, {})
-- Mostrar/Ocultar numeros relativos
vim.api.nvim_create_user_command("ToggleRel", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, {})
