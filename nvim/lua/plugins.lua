local add_dep = require("dcxo.lazy.util").add_dep

return {
  add_dep("nvim-neo-tree/neo-tree.nvim"),

  add_dep("marko-cerovac/material.nvim", { isColorscheme = true }),
  add_dep("Shatur/neovim-ayu"),

  add_dep("kylechui/nvim-surround"),
  add_dep("echasnovski/mini.bracketed", true),

  add_dep("Shatur/neovim-session-manager"),

  add_dep("nvim-telescope/telescope.nvim"),
  add_dep("stevearc/dressing.nvim"),

  add_dep("nvim-treesitter/nvim-treesitter"),
  add_dep("neovim/nvim-lspconfig"),
  add_dep("williamboman/mason.nvim", true),
  add_dep("williamboman/mason-lspconfig.nvim"),
  add_dep("jay-babu/mason-null-ls.nvim"),
  add_dep("nvimtools/none-ls.nvim"),

  add_dep("nvim-lualine/lualine.nvim"),

  -- add_dep("ms-jpq/coq_nvim"),
  add_dep("hrsh7th/nvim-cmp"),

  add_dep("Saecki/crates.nvim"),
  add_dep("simrat39/rust-tools.nvim"),

  add_dep("pmizio/typescript-tools.nvim"),
  add_dep("sigmasd/deno-nvim"),

  add_dep("numToStr/Comment.nvim", true),
  add_dep("windwp/nvim-autopairs"),
  add_dep("cshuaimin/ssr.nvim"),
  add_dep("folke/todo-comments.nvim", true),
  add_dep("folke/neodev.nvim", true),
  add_dep("themaxmarchuk/tailwindcss-colors.nvim", true),
  add_dep("nvim-lua/plenary.nvim"),
  add_dep("folke/noice.nvim"),
  add_dep("folke/neoconf.nvim"),
  add_dep("b0o/schemastore.nvim"),
  add_dep("Wansmer/treesj"),
  add_dep("monaqa/dial.nvim"),
  add_dep("folke/trouble.nvim"),
}
