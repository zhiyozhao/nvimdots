local M = {}

local settings = require("core.settings").plugins.theme

M.tokyonight = function()
    require("tokyonight").setup({
        transparent = settings.transparent,
        styles = {
            sidebars = settings.transparent and "transparent" or "dark",
            floats = settings.transparent and "transparent" or "dark",
        },
    })
    vim.cmd("colorscheme " .. settings.name)
end

return M
