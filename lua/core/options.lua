local M = {}

local settings = require("core.settings")

local set_opts = function(opts)
    for k, v in pairs(opts) do
        vim.opt[k] = v
    end
end

M.load = function()
    local opts = {
        mouse = "a",
        termguicolors = true,
        number = true,
        signcolumn = "yes",
        foldcolumn = "1",
        cursorline = true,
        laststatus = 3,
        wrap = false,
        scrolloff = 8,
        sidescrolloff = 8,
        fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" },
        fileencodings = { "ucs-bom", "utf-8", "gbk", "big5", "gb18030", "latin1" },
        ignorecase = true,
        smartcase = true,
        tabstop = 4,
        expandtab = true,
        shiftwidth = 0,
        smartindent = true,
        pumheight = 10,
        completeopt = { "menuone", "noselect" },
        swapfile = false,
        undofile = true,
        splitbelow = true,
        splitright = true,
    }

    set_opts(opts)
    vim.g.mapleader = settings.mapleader
end

M.ufo = function()
    local opts = {
        foldlevel = 99,
        foldlevelstart = 99,
    }

    set_opts(opts)
end

return M
