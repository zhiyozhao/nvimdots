local settings = require("core.settings").plugins.lsp
local configs = require("plugins.config.lsp")

return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        config = configs.mason,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = configs.lspconfig,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        enabled = settings.enabled,
        config = configs.mason_lspconfig,
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        enabled = settings.enabled,
        config = configs.mason_tool_installer,
        dependencies = { "williamboman/mason.nvim" },
    },
    {
        "stevearc/conform.nvim",
        enabled = settings.enabled,
        config = configs.conform,
    },
}
