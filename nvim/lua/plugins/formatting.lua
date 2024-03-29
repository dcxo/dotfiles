return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = { "deno_fmt", "prettier", "eslint_d" },
      automatic_installation = false,
      handlers = {
        ["deno_fmt"] = function() end,
        ["biome"] = function() end,
        ["prettier"] = function() end,
        ["eslint_d"] = function() end,
      },
    })
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({
              "eslint.config.js",
              ".eslintrc",
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
            }) and not utils.root_has_file({ "biome.json", "deno.jsonc" })
          end,
        }),
        null_ls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.yaml",
              ".prettierrc.json5",
              ".prettierrc.js",
              ".prettierrc.cjs",
              ".prettierrc.toml",
              "prettier.config.js",
              "prettier.config.cjs",
              "package.json",
            }) and not utils.root_has_file({ "biome.json", "deno.jsonc" })
          end,
        }),
        null_ls.builtins.formatting.deno_fmt.with({
          condition = function(utils)
            return utils.root_has_file({ "deno.json", "deno.jsonc" })
          end,
        }),
        null_ls.builtins.formatting.biome.with({
          condition = function(utils)
            return utils.root_has_file({ "biome.json" })
          end,
        }),
      },
    })
  end,
}
