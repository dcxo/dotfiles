return {
  opts = {
    styles = {},
    plugins = { -- Uncomment the plugins that you use to highlight them
      -- Available plugins:
      -- "dap",
      -- "dashboard",
      -- "eyeliner",
      -- "fidget"
      -- "flash"
      -- "gitsigns",
      -- "harpoon",
      -- "hop",
      -- "illuminate",
      -- "indent-blankline",
      -- "lspsaga",
      -- "mini",
      -- "neogit",
      -- "neotest",
      -- "neorg",
      "noice",
      -- "nvim-cmp",
      -- "nvim-navic",
      -- "nvim-tree",
      "nvim-web-devicons",
      -- "rainbow-delimiters",
      -- "sneak",
      "telescope",
      -- "trouble",
      -- "which-key",
    },
    contrast = {
      terminal = false, -- Enable contrast for the built-in terminal
      sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
      floating_windows = false, -- Enable contrast for floating windows
      cursor_line = false, -- Enable darker background for the cursor line
      non_current_windows = true, -- Enable contrasted background for non-current windows
      filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },
  },
}
