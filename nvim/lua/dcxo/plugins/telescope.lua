return {
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
  opts = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_cursor({}),
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<Esc>"] = require("telescope.actions").close,
          },
        },
      },
      pickers = {
        lsp_dynamic_workspace_symbols = { theme = "dropdown" },
        lsp_workspace_symbols = { theme = "dropdown", previewer = false },
        lsp_document_symbols = { theme = "dropdown", previewer = false },
      },
    })
    require("telescope").load_extension("ui-select")
  end,
  keys = {
    {
      "<Leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "File Files",
    },
    {
      "<leader>.",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Find sibling files",
    },
    {
      "<leader>fi",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Find inside file",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Search through files",
    },
    {
      "<leader>sw",
      function()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      desc = "Find workspace symbols",
    },
    {
      "<leader>sd",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "Find document symbols",
    },
    {
      "<leader>gr",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "Find references",
    },
    {
      "<leader>gd",
      function()
        require("telescope.builtin").lsp_type_definitions()
      end,
      desc = "Go to definition",
    },
    {
      "ggb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Show git branches",
    },
  },
}
