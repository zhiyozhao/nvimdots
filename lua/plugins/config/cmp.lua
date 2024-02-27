local M = {}

local settings = require("core.settings")
local mappings = require("core.mappings")

M.cmp = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup(vim.tbl_deep_extend("error", {
        experimental = { ghost_text = true },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        completion = {
            completeopt = "menuone",
        },
        sources = cmp.config.sources({
            { name = "luasnip" },
            { name = "nvim_lsp" },
        }, {
            { name = "buffer" },
            { name = "path" },
        }),
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                vim_item.kind = settings.kind_icons[vim_item.kind]
                vim_item.menu = ({
                    luasnip = "[SNIP]",
                    nvim_lsp = "[LSP]",
                    buffer = "[BUFF]",
                    path = "[PATH]",
                    cmdline = "[CMD]",
                })[entry.source.name]

                return vim_item
            end,
        },
    }, mappings.nvim_cmp_insert_inner()))

    cmp.setup.cmdline(
        { "/", "?" },
        vim.tbl_deep_extend("error", {
            completion = {
                completeopt = "menuone,noselect",
            },
            sources = cmp.config.sources({
                { name = "buffer" },
            }),
        }, mappings.nvim_cmp_cmd_inner())
    )

    cmp.setup.cmdline(
        ":",
        vim.tbl_deep_extend("error", {
            completion = {
                completeopt = "menuone,noselect",
            },
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        }, mappings.nvim_cmp_cmd_inner())
    )
end

M.luasnip = function()
    require("luasnip").setup()
    require("luasnip.loaders.from_vscode").lazy_load()
end

return M
