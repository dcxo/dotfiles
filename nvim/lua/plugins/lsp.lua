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
    require("mason-lspconfig").setup({
      ensure_installed = { "rust_analyzer", "denols" },
    })

    require("dcxo.lsp")
  end,
}
