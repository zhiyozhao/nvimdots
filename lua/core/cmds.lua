local M = {}

local settings = require("core.settings")

local usercmd = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

local auto_input_select = {
    select_command = settings.auto_input_select.select_command,
    default_input = settings.auto_input_select.default_input,
    prev_input = nil,
    set_default_events = { "VimEnter", "FocusGained", "InsertLeave" },
    set_prev_events = { "InsertEnter" },

    set_default = function(self)
        self.prev_input = vim.trim(vim.fn.system(self.select_command))
        vim.fn.system(self.select_command .. " " .. self.default_input)
    end,

    set_prev = function(self)
        vim.fn.system(self.select_command .. " " .. self.prev_input)
    end,
}

M.load = function()
    local default = vim.api.nvim_create_augroup("default", { clear = true })

    usercmd("Trim", [[silent! %s/\v\s+$//|nohlsearch]], {})
    usercmd("BufDel", "bprevious|silent! bdelete#", {})
    usercmd("BufOnly", "silent! :1,.-1bdelete|silent! .+1,$bdelete", {})
    usercmd("Quit", "wall|qall", {})

    if settings.autosave then
        autocmd("TextChanged", {
            group = default,
            command = "silent! update",
        })
    end
    if settings.autoload then
        autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
            group = default,
            command = "checktime",
        })
    end
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
