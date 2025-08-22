-- Neovide (GUI) settings — solo si lo estás usando
if vim.g.neovide then
    vim.o.guifont = "CodeNewRoman Nerd Font:h14"
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_opacity = 0.1
    vim.g.neovide_scroll_animation_length = 0.2
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_remember_window_size = true
end
