local M = {}

local mappings = require("core.mappings")

M.treesitter = function()
    require("nvim-treesitter.configs").setup({ auto_install = true })
end

return M
