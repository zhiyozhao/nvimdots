local M = {}

local settings = require("core.settings").plugins.lsp
local mappings = require("core.mappings")

M.mason = function()
    require("mason").setup()
end

M.lspconfig = function()
    mappings.lspconfig()
end

M.mason_lspconfig = function()
    local lspconfig = require("lspconfig")

    local capabilities = lspconfig.util.default_config.capabilities
    if pcall(require, "cmp_nvim_lsp") then
        local extra = require("cmp_nvim_lsp").default_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, extra)
    end
    if pcall(require, "ufo") then
        local extra = {
            textDocument = {
                foldingRange = { dynamicRegistration = false, lineFoldingOnly = true },
            },
        }
        capabilities = vim.tbl_deep_extend("force", capabilities, extra)
    end

    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
        function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
        end,
    })
end

M.mason_tool_installer = function()
    require("mason-tool-installer").setup({
        ensure_installed = settings.ensure_installed,
    })
end

M.conform = function()
    require("conform").setup({ formatters_by_ft = settings.conform_fmt })
    mappings.conform()
end

return M
