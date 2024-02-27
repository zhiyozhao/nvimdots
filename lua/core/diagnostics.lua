local M = {}

local settings = require("core.settings")

M.load = function()
    for k, v in pairs(settings.diagnostic_icons) do
        vim.fn.sign_define(k, v)
    end
    vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        float = { border = "rounded" },
    })
end

return M
