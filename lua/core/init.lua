local M = {}

M.load = function()
    if vim.g.vscode then
        require("core.options").load_vsc()
        require("core.mappings").load_vsc()
        require("core.cmds").load_vsc()
        require("core.plugins").load()
    else
        require("core.options").load()
        require("core.mappings").load()
        require("core.cmds").load()
        require("core.diagnostics").load()
        require("core.plugins").load()
    end
end

return M
