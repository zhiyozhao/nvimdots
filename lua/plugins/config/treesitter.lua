local M = {}

local mappings = require("core.mappings")

M.treesitter = function()
    require("nvim-treesitter.configs").setup(vim.tbl_deep_extend("error", {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                selection_modes = {
                    ["@class.inner"] = "V",
                    ["@class.outer"] = "V",
                    ["@function.inner"] = "V",
                    ["@function.outer"] = "V",
                    ["@parameter.inner"] = "v",
                    ["@parameter.outer"] = "v",
                },
            },
        },
        textsubjects = { enable = true },
    }, mappings.treesitter_inner()))
end

return M
