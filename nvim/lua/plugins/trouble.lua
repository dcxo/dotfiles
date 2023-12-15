return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    positions = "right",
    mode = "document_diagnostics",
  },
  keys = {
    {
      "<leader>?",
      function()
        require("trouble").toggle()
      end,
    },
  },
}
