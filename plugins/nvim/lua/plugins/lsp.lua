local lsp = require("config.lsp")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false, },
              diagnostics = { globals = { "vim" }, },
            },
          },
        },
        sourcekit = {
          cmd = { "sourcekit-lsp" },
          filetypes = { "swift", "objective-c", "objective-cpp" },
          root_dir = require("lspconfig.util").root_pattern("Package.swift", ".git"),
        },
      },
      setup = {
        ["*"] = function(server, opts)
          opts.on_attach = lsp.on_attach
          opts.capabilities = lsp.capabilities
          require("lspconfig")[server].setup(opts)
        end,
      },
    },
  },
}
