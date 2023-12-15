return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "David-Kunz/cmp-npm",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "windwp/nvim-autopairs",
    "hrsh7th/cmp-calc",
    -- "js-everts/cmp-tailwind-colors",
    "hrsh7th/cmp-omni",
  },
  event = { "InsertEnter" },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    local select_opts = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      formatting = {
        -- format = require("cmp-tailwind-colors").format,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
        ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
        ["<Down>"] = cmp.mapping.select_next_item(select_opts),
        ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          local col = vim.fn.col(".") - 1
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
            fallback()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
        ["<C-f>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp_document_symbol" },
        {
          name = "omni",
          option = {
            disable_omnifuncs = { "v:lua.vim.lsp.omnifunc" },
          },
        },
        { name = "nvim_lua" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "calc" },
        { name = "crates" },
        { name = "npm", keyword_length = 4 },
      }),
    })
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
