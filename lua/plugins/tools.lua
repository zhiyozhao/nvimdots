local settings = require("core.settings").plugins.tools
local configs = require("plugins.config.tools")

return {
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = settings.enabled("indent_blankline"),
        config = configs.indent_blankline,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        enabled = settings.enabled("rainbow_delimiters"),
        config = configs.rainbow_delimiters,
    },
    {
        "lewis6991/gitsigns.nvim",
        enabled = settings.enabled("gitsigns"),
        config = configs.gitsigns,
    },
    {
        "RRethy/vim-illuminate",
        enabled = settings.enabled("illuminate"),
        config = configs.illuminate,
    },
    {
        "windwp/nvim-autopairs",
        enabled = settings.enabled("autopairs"),
        config = configs.autopairs,
    },
    {
        "kylechui/nvim-surround",
        enabled = settings.enabled("surround"),
        config = configs.surround,
    },
    {
        "numToStr/Comment.nvim",
        enabled = settings.enabled("comment"),
        config = configs.comment,
    },
    {
        "folke/todo-comments.nvim",
        enabled = settings.enabled("todo_comments"),
        config = configs.todo_comments,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "smoka7/hop.nvim",
        enabled = settings.enabled("hop"),
        config = configs.hop,
    },
    {
        "kevinhwang91/nvim-ufo",
        enabled = settings.enabled("ufo"),
        config = configs.ufo,
        dependencies = { "kevinhwang91/promise-async" },
    },
    {
        "kwkarlwang/bufjump.nvim",
        enabled = settings.enabled("bufjump"),
        config = configs.bufjump,
    },
    {
        "abecodes/tabout.nvim",
        enabled = settings.enabled("tabout"),
        config = configs.tabout,
    },
}
