local M = {}

local settings = require("core.settings")

local map = vim.keymap.set

M.load = function()
    map("i", "<D-v>", "<C-r>*")
    map({ "n", "x" }, "gy", '"*y')
    map({ "n", "x" }, "gp", '"*p')
    map({ "n", "x" }, "gP", '"*P')
    map({ "n", "x" }, "<leader>y", '"0y')
    map({ "n", "x" }, "<leader>p", '"0p')
    map({ "n", "x" }, "<leader>P", '"0P')

    map({ "n", "x", "o" }, "/", "/\\v")
    map({ "n", "x", "o" }, "?", "?\\v")
    map("n", "gs", ":%s/\\v")
    map("x", "gs", ":s/\\v")

    map({ "n", "x", "o" }, "'", "`")
    map({ "n", "x", "o" }, "`", "'")

    map("x", "<", "<gv")
    map("x", ">", ">gv")
end

M.flash = function()
    local flash = require("flash")

    map({ "n", "x", "o" }, "s", flash.jump)
    map({ "n", "x", "o" }, "S", flash.treesitter)
    map({ "n", "o", "x" }, "R", flash.treesitter_search)
    map("o", "r", flash.remote)
end

return M
