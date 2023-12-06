vim.loader.enable()

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = { space = "·", tab = ">~" }
vim.opt.foldlevelstart = 99
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

require("dcxo.lazy")
require("dcxo.lsp")

vim.cmd([[ colorscheme ayu ]])
