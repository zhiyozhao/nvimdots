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

    -- Clipboard config: Use OSC 52 for terminal (works over SSH),
    -- but skip in VSCode (it handles clipboard natively)
    if not vim.g.vscode then
        vim.g.clipboard = {
            name = "OSC 52",
            copy = {
                ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
                ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
            },
            paste = {
                ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
                ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
            },
        }
    end

end

return M