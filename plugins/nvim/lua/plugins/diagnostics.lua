return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- run default setup first
      vim.diagnostic.config(opts.diagnostics)

      -- disable all diagnostics globally at startup
      vim.schedule(function()
        vim.diagnostic.enable(false)
      end)
    end,
  },
}
