local M = {}

local mappings = require("core.mappings")

M.flash = function()
    require("flash").setup()
    mappings.flash()
end

M.mini_ai = function()
    require("mini.ai").setup()
end

return M