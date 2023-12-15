local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require("lspconfig.util")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function nullLsFormat(bufnr)
  return function()
    vim.lsp.buf.format({
      async = false,
      bufnr = bufnr,
      filter = function(format_client)
        return format_client.name == "null-ls"
      end,
    })
  end
end

local function rustAnalyzerFormat(bufnr)
  return function()
    vim.lsp.buf.format({
      async = false,
      bufnr = bufnr,
    })
  end
end

local exceptions = {
  ["rust_analyzer"] = rustAnalyzerFormat,
  ["typescript-tools"] = rustAnalyzerFormat,
  ["jsonls"] = rustAnalyzerFormat,
  ["astro"] = rustAnalyzerFormat,
}

local opts = {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = (exceptions[client.name] or nullLsFormat)(bufnr),
      })
    end
  end,
}

require("mason-lspconfig").setup_handlers({
  function(server_name)
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
