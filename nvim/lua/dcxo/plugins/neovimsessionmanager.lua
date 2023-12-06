return {
  dependencies = { "nvim-neo-tree/neo-tree.nvim" },
  config = function()
    local config_group = vim.api.nvim_create_augroup("SessionManagerEvents", {}) -- A global group for all your config autocommands
    local session_manager = require("session_manager")
    local config = require("session_manager.config")

    session_manager.setup({
      autoload_mode = config.AutoloadMode.CurrentDir,
      autosave_ignore_filetypes = {
        "gitcommit",
        "gitrebase",
        "neo-tree",
      },
      autosave_ignore_buftypes = {
        "nofile",
        "help",
      },
    })

    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "SessionLoadPost",
      group = config_group,
      callback = function()
        vim.cmd([[Neotree show reveal]])
      end,
    })
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      group = config_group,
      callback = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          -- Don't save while there's any 'nofile' buffer open.
          if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
            return
          end
        end
        session_manager.save_current_session()
      end,
    })
  end,
}
