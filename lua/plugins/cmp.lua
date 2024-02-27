local settings = require("core.settings").plugins.cmp
local configs = require("plugins.config.cmp")

return {
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        config = configs.luasnip,
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
        "hrsh7th/nvim-cmp",
        enabled = settings.enabled,
        config = configs.cmp,
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
    },
}
