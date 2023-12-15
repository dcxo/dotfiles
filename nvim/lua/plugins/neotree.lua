return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 25,
    },
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  keys = {
    { "<leader>e", "<cmd>Neotree reveal<cr>", desc = "Toggle NeoTree" },
    { "<leader>/", "<cmd>Neotree toggle right document_symbols<cr>" },
  },
}
