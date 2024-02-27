local M = {}

local settings = require("core.settings")
local options = require("core.options")
local mappings = require("core.mappings")

M.indent_blankline = function()
    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        for k, v in pairs(settings.rainbow_highlights.defs) do
            vim.api.nvim_set_hl(0, k, v)
        end
    end)
    require("ibl").setup({
        scope = { highlight = settings.rainbow_highlights.orders },
    })
end

M.rainbow_delimiters = function()
    require("rainbow-delimiters.setup").setup({
        highlight = settings.rainbow_highlights.orders,
    })
end

M.gitsigns = function()
    require("gitsigns").setup({
        numhl = true,
        sign_priority = 1000,
        preview_config = { border = "rounded" },
        on_attach = mappings.gitsigns,
    })
end

M.illuminate = function() end

M.autopairs = function()
    require("nvim-autopairs").setup()
end

M.surround = function()
    require("nvim-surround").setup(vim.tbl_deep_extend("error", {}, mappings.surround_inner()))
end

M.comment = function()
    require("Comment").setup(vim.tbl_deep_extend("error", {}, mappings.comment_inner()))
end

M.todo_comments = function()
    require("todo-comments").setup()
end

M.hop = function()
    require("hop").setup()
    mappings.hop()
end

M.ufo = function()
    require("ufo").setup(vim.tbl_deep_extend("error", {
        open_fold_hl_timeout = 0,
        preview = {
            win_config = { winblend = 0 },
        },
    }, mappings.ufo_inner()))
    mappings.ufo()
    options.ufo()
end

M.bufjump = function()
    require("bufjump").setup(vim.tbl_deep_extend("error", {
        on_success = function()
            vim.cmd([[execute "normal! g`\"zz"]])
        end,
    }, mappings.bufjump_inner()))
end

M.tabout = function()
    require("tabout").setup()
end

return M
