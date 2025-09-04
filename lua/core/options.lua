local M = {}

local settings = require("core.settings")

local set_opts = function(opts)
    for k, v in pairs(opts) do
        vim.opt[k] = v
    end
end

M.load = function()
    local opts = {
        ignorecase = true,
        smartcase = true,
        tabstop = 4,
        expandtab = true,
        shiftwidth = 0,
        smartindent = true,
    }

    set_opts(opts)
    vim.g.mapleader = settings.mapleader
end

return M