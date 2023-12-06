return {
  config = function()
    local rt = require("rust-tools")
    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },
    })
  end,
}
