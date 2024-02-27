local settings = require("core.settings").plugins.theme
local configs = require("plugins.config.theme")

return {
    {
        "folke/tokyonight.nvim",
        lazy = not vim.startswith(settings.name, "tokyonight"),
        priority = 1000,
        config = configs.tokyonight,
    },
}
