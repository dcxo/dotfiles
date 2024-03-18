local builtin = require("telescope.builtin")

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set({ "n", "v" }, "]d", vim.diagnostic.goto_next)
vim.keymap.set({ "n", "v" }, "[d", vim.diagnostic.goto_prev)
vim.keymap.set({ "n", "v" }, "K", vim.lsp.buf.hover)
