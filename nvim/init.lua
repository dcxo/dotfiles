vim.loader.enable()

vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = { space = "·", tab = ">~" }
vim.opt.foldlevelstart = 99
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

require("dcxo.lazy")

vim.cmd([[ colorscheme ayu ]])

local smartCaseCmdGroup = vim.api.nvim_create_augroup("dynamic_smartcase", {})
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = smartCaseCmdGroup,
  callback = function()
    vim.opt.smartcase = false
  end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = smartCaseCmdGroup,
  callback = function()
    vim.opt.smartcase = true
  end,
})

if vim.g.neovide then
  vim.keymap.set("n", "<c-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<c-c>", '"+y') -- Copy
  vim.keymap.set("n", "<c-s-v>", '"+P') -- Paste normal mode
  -- vim.keymap.set("v", "<c-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<c-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<c-v>", '<ESC>l"+Pli') -- Paste insert mode
end
