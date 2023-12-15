return {
  "Saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  ft = { "toml" },
  opts = {
    src = {
      cmp = {
        enabled = true,
      },
    },
  },
}
