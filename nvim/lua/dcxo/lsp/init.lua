local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require("lspconfig.util")

local opts = {
  capabilities = capabilities,
}

require("mason-lspconfig").setup_handlers({
  function(server_name)
    if server_name == "tailwindcss" then
      opts.on_attach = function(_, bufnr)
        require("tailwindcss-colors").buf_attach(bufnr)
      end
    end

    require("lspconfig")[server_name].setup(opts)
  end,
  ["denols"] = function()
    local new_opts = vim.tbl_extend("error", opts, {
      root_dir = util.root_pattern("deno.json", "deno.jsonc"),
    })
    require("lspconfig").denols.setup(new_opts)
  end,
  ["biome"] = function()
    local new_opts = vim.tbl_extend("error", opts, {
      root_dir = util.root_pattern("biome.json"),
      single_file_support = false,
    })
    require("lspconfig").biome.setup(new_opts)
  end,
  ["jsonls"] = function()
    require("lspconfig").jsonls.setup({
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
  ["yamlls"] = function()
    require("lspconfig").yamlls.setup({
      settings = {
        yaml = {
          schemaStore = {
            enable = false,
            url = "",
          },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
    })
  end,
})

require("dcxo.lsp.keymaps")
