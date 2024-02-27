local settings = require("core.settings").plugins.components
local mappings = require("core.mappings")
local configs = require("plugins.config.components")

return {
    {
        "nvim-telescope/telescope.nvim",
        enabled = settings.enabled("telescope"),
        keys = mappings.telescope_keys,
        cmd = mappings.telescope_cmds,
        config = configs.telescope,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = {
                    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release",
                    "cmake --build build --config Release",
                    "cmake --install build --prefix build",
                },
            },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = settings.enabled("neo_tree"),
        keys = mappings.neo_tree_keys,
        cmd = mappings.neo_tree_cmds,
        config = configs.neo_tree,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "akinsho/toggleterm.nvim",
        enabled = settings.enabled("toggleterm"),
        keys = mappings.toggleterm_keys,
        cmd = mappings.toggleterm_cmds,
        config = configs.toggleterm,
    },
    {
        "sindrets/diffview.nvim",
        enabled = settings.enabled("diffview"),
        keys = mappings.diffview_keys,
        cmd = mappings.diffview_cmds,
        config = configs.diffview,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "folke/trouble.nvim",
        enabled = settings.enabled("trouble"),
        keys = mappings.trouble_keys,
        cmd = mappings.trouble_cmds,
        config = configs.trouble,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-lualine/lualine.nvim",
        enabled = settings.enabled("lualine"),
        config = configs.lualine,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "goolord/alpha-nvim",
        enabled = settings.enabled("alpha"),
        config = configs.alpha,
    },
}
