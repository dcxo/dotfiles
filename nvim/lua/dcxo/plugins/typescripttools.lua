return {
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    local util = require("lspconfig.util")
    require("typescript-tools").setup({
      root_dir = function(fname)
        return (
          (not util.root_pattern("deno.json", "deno.jsonc")(fname))
          and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
        )
      end,
    })
  end,
}
