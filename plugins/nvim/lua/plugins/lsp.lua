return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" }, },
              library = {
                vim.env.VIMRUNTIME,
              },
              workspace = { checkThirdParty = false, },
            },
          },
        },
        sourcekit = {
          cmd = { "sourcekit-lsp" },
          filetypes = { "swift", "objective-c", "objective-cpp" },
          root_dir = require("lspconfig.util")
            .root_pattern("Package.swift", ".git", "*.xcodeproj"),
        },
      },
      setup = {
        ["*"] = function(server, opts)
          local lsp = require("config.lsp")
          opts.on_attach = function(client, bufnr)
            lsp.on_attach(client, bufnr)
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
          end
          opts.capabilities = lsp.capabilities
          require("lspconfig")[server].setup(opts)
        end,
      },
    },
  },
}
