local M = {}

local settings = require("core.settings")

local autocmd = vim.api.nvim_create_autocmd

local auto_input_select = {
    select_command = settings.auto_input_select.select_command,
    default_input = settings.auto_input_select.default_input,
    prev_input = settings.auto_input_select.default_input,
    set_default_events = { "VimEnter", "FocusGained", "InsertLeave" },
    set_prev_events = { "InsertEnter" },

    set_default = function(self)
        self.prev_input = vim.trim(vim.fn.system({ self.select_command }))
        vim.fn.system({ self.select_command, self.default_input })
    end,

    set_prev = function(self)
        vim.fn.system({ self.select_command, self.prev_input })
    end,
}

M.load = function()
    local default = vim.api.nvim_create_augroup("default", { clear = true })

    if settings.auto_input_select.enabled then
        autocmd(auto_input_select.set_default_events, {
            group = default,
            callback = function()
                auto_input_select:set_default()
            end,
        })
        autocmd(auto_input_select.set_prev_events, {
            group = default,
            callback = function()
                auto_input_select:set_prev()
            end,
        })
    end
end

return M