local lang_settings = {
    settings = {
        {
            lang = "python",
            lsp = "pyright",
            fmt = "black",
        },
        {
            lang = "lua",
            lsp = "lua_ls",
            fmt = "stylua",
        },
        {
            lang = "markdown",
            fmt = "prettier",
        },
    },
    -- TODO: avoiding duplication when gathering
    treesitter_ensure_installed = function(self)
        local res = {}

        for _, v in ipairs(self.settings) do
            if v["lang"] then
                table.insert(res, v["lang"])
            end
        end

        return res
    end,
    mason_ensure_installed = function(self)
        local res = {}

        for _, v in ipairs(self.settings) do
            if v["lsp"] then
                table.insert(res, v["lsp"])
            end
            if v["fmt"] then
                table.insert(res, v["fmt"])
            end
        end

        return res
    end,
    conform_fmt = function(self)
        local res = {}

        for _, v in ipairs(self.settings) do
            if v["lang"] and v["fmt"] then
                res[v["lang"]] = { v["fmt"] }
            end
        end

        return res
    end,
}

return {
    kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
    },
    diagnostic_icons = {
        DiagnosticSignError = { text = "", texthl = "DiagnosticSignError" },
        DiagnosticSignWarn = { text = "", texthl = "DiagnosticSignWarn" },
        DiagnosticSignInfo = { text = "", texthl = "DiagnosticSignInfo" },
        DiagnosticSignHint = { text = "󰌵", texthl = "DiagnosticSignHint" },
    },
    rainbow_highlights = {
        defs = {
            RainbowRed = { fg = "#E06C75" },
            RainbowYellow = { fg = "#E5C07B" },
            RainbowBlue = { fg = "#61AFEF" },
            RainbowGreen = { fg = "#98C379" },
            RainbowOrange = { fg = "#D19A66" },
            RainbowViolet = { fg = "#C678DD" },
            RainbowCyan = { fg = "#56B6C2" },
        },
        orders = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowGreen",
            "RainbowOrange",
            "RainbowViolet",
            "RainbowCyan",
        },
    },
    mapleader = " ",
    autosave = true,
    autoload = true,
    auto_input_select = {
        enabled = true,
        select_command = "im-select",
        default_input = "com.apple.keylayout.ABC",
    },
    find = {
        project_dirs = { "~/Codes", "~/tmp", "~/Downloads" },
        find_proj = { "fd", "-t", "d", "-d", "1" },
        find_all = { "fd", "-I", "-d", "6", "-E", "Library/" },
        find_ALL = { "fd", "-I", "-d", "6", "-E", "Library/" },
    },
    plugins = {
        dir = "plugins",
        theme = { name = "tokyonight-night", transparent = false },
        lsp = {
            enabled = true,
            ensure_installed = lang_settings:mason_ensure_installed(),
            conform_fmt = lang_settings:conform_fmt(),
        },
        cmp = { enabled = true },
        treesitter = {
            enabled = true,
            ensure_installed = lang_settings:treesitter_ensure_installed(),
        },
        components = {
            enabled = function(name)
                local enabled_list = {
                    "telescope",
                    "neo_tree",
                    "toggleterm",
                    "diffview",
                    "trouble",
                    "lualine",
                    "alpha",
                }

                return vim.tbl_contains(enabled_list, name)
            end,
        },
        tools = {
            enabled = function(name)
                local enabled_list = {
                    "indent_blankline",
                    "rainbow_delimiters",
                    "gitsigns",
                    "illuminate",
                    "autopairs",
                    "surround",
                    "comment",
                    "todo_comments",
                    "hop",
                    "ufo",
                    "bufjump",
                    "tabout",
                }

                return vim.tbl_contains(enabled_list, name)
            end,
        },
    },
}
