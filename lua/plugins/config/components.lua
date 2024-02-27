local M = {}

local mappings = require("core.mappings")

M.telescope = function()
    require("telescope").setup(vim.tbl_deep_extend("error", {
        defaults = {
            layout_strategy = "flex",
            layout_config = {
                scroll_speed = 5,
                flex = { flip_columns = 160 },
                horizontal = { preview_width = 0.6 },
                vertical = { preview_height = 0.6 },
            },
        },
    }, mappings.telescope_inner()))

    require("telescope").load_extension("fzf")
    mappings.telescope()
end

M.neo_tree = function()
    require("neo-tree").setup(vim.tbl_deep_extend("error", {
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_modified_markers = false,
        use_default_mappings = false,
        sources = { "filesystem", "git_status", "document_symbols" },
        source_selector = {
            winbar = true,
            content_layout = "center",
            sources = {
                { source = "filesystem" },
                { source = "git_status" },
                { source = "document_symbols" },
            },
        },
        default_component_configs = {
            indent = { with_expanders = true },
            git_status = {
                symbols = { added = "", deleted = "", modified = "", renamed = "" },
            },
        },
        filesystem = { follow_current_file = { enabled = true } },
        document_symbols = { follow_cursor = true },
    }, mappings.neo_tree_inner()))
    mappings.neo_tree()
end

M.toggleterm = function()
    require("toggleterm").setup(vim.tbl_deep_extend("error", {
        direction = "float",
        float_opts = { border = "rounded" },
    }, mappings.toggleterm_inner()))
end

M.diffview = function()
    require("diffview").setup()
    mappings.diffview()
end

M.trouble = function()
    require("trouble").setup({ use_diagnostic_signs = true })
    mappings.trouble()
end

M.lualine = function()
    require("lualine").setup({
        options = {
            component_separators = "|",
            section_separators = "",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", path = 1 } },
            lualine_x = { { "windows", mode = 1 } },
            lualine_y = { "filetype" },
            lualine_z = { "progress", "location" },
        },
        tabline = {
            lualine_a = { { "buffers", mode = 4 } },
            lualine_z = { "tabs" },
        },
    })
end

M.alpha = function()
    local fortune = require("alpha.fortune")
    local button = require("alpha.themes.dashboard").button

    local config = {
        layout = {
            { type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.3) }) },
            {
                type = "text",
                val = {
                    "██╗   ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗",
                    "██║   ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝",
                    "██║   ██║███████╗██║     ██║   ██║██║  ██║█████╗  ",
                    "╚██╗ ██╔╝╚════██║██║     ██║   ██║██║  ██║██╔══╝  ",
                    " ╚████╔╝ ███████║╚██████╗╚██████╔╝██████╔╝███████╗",
                    "  ╚═══╝  ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝",
                },
                opts = {
                    position = "center",
                    hl = "Type",
                },
            },
            { type = "padding", val = 2 },
            {
                type = "group",
                val = {
                    button("e", ">  New file", "<cmd>enew<cr>"),
                    button("f", ">  Find file", "<C-space>", { remap = true }),
                    button("p", ">  Projects", "<leader>fp", { remap = true }),
                    button("q", ">  Quit NVIM", "<cmd>qa<cr>"),
                },
                opts = {
                    spacing = 1,
                },
            },
            { type = "padding", val = 1 },
            {
                type = "text",
                val = fortune(),
                opts = {
                    position = "center",
                    hl = "Number",
                },
            },
        },
    }

    require("alpha").setup(config)
end

return M
