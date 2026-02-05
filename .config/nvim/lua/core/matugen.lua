local M = {}

function M.get_colors()
    -- Esta ruta debe coincidir con el output_path de tu config.toml
    local path = vim.fn.expand("~/.config/nvim/matugen/matugen-nvim.conf")
    local file = io.open(path, "r")

    if not file then
        -- Backup por si el archivo no existe aún
        return { colors = { surface = "#1d2021", on_surface = "#ebdbb2", primary = "#fabd2f" } }
    end

    local content = file:read("*a")
    file:close()

    -- Parseamos el JSON generado por Matugen
    return vim.json.decode(content)
end

return M
