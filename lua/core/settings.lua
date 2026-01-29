settings = {
    mapleader = " ",
    auto_input_select = {
        enabled = jit.os == "OSX",
        select_command = "im-select",
        default_input = "com.apple.keylayout.ABC",
    },
    plugins = {
        dir = "plugins",
        treesitter = {
            enabled = true,
            ensure_installed = { "python", "lua", "markdown" },
        },
        tools = {
            enabled = function(name)
                local enabled_list = { "flash", "mini_ai" }
                return vim.tbl_contains(enabled_list, name)
            end,
        },
    },
}

return settings