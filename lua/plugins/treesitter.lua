local settings = require("core.settings").plugins.treesitter
local configs = require("plugins.config.treesitter")

return {
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = settings.enabled,
        build = ":TSUpdate",
        config = configs.treesitter,
    },
}
