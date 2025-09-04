local settings = require("core.settings").plugins.tools
local configs = require("plugins.config.tools")

return {
    {
        "folke/flash.nvim",
        enabled = settings.enabled("flash"),
        config = configs.flash,
    },
    {
        "echasnovski/mini.ai",
        enabled = settings.enabled("mini_ai"),
        config = configs.mini_ai,
    },
}