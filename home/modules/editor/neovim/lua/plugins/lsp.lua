return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    {
      "williamboman/mason.nvim",
      opts = true,
    },
  },
  config = function()
    require("mason-lspconfig").setup({})

    require("dcxo.lsp")
  end,
}
