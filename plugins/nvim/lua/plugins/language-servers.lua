local util = require("lspconfig.util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {

        -- Bash / Shell
        bashls = {
          cmd = { "bash-language-server", "start" },
          filetypes = { "sh", "bash", "zsh" },
          root_dir = vim.fs.dirname(vim.fs.find(".git", { path = startpath, upward = true })[1]),
        },

        -- C / C++
        clangd = {
          cmd = { "clangd" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          root_dir = util.root_pattern("compile_commands.json", ".git"),
        },

        -- C# / .NET
        omnisharp = {
          cmd = { "omnisharp" },
          root_dir = util.root_pattern("*.sln", "*.csproj", ".git"),
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
          settings = {
            FormattingOptions = {
              EnableEditorConfigSupport = true,
              OrganizeImports = true,
            },
          },
        },

        -- Go
        gopls = {},

        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              library = { vim.env.VIMRUNTIME },
            },
          },
        },

        -- PHP
        intelephense = {},

        -- Python
        pyright = {},

        -- Ruby
        solargraph = {},

        -- Rust
        rust_analyzer = {
          cmd = { "rust-analyzer" },
          root_dir = util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
        },

        -- SQL
        sqls = {
          filetypes = { "sql", "mysql", "pgsql" },
          root_dir  = util.root_pattern("schema.sql", "migrations", ".git"),
        },

        -- Swift / Objective-C
        sourcekit = {
          cmd = { "sourcekit-lsp" },
          filetypes = { "swift", "objective-c", "objective-cpp" },
          root_dir = util.root_pattern("Package.swift", "*.xcodeproj", ".git"),
        },

        -- JavaScript / TypeScript / React / React Native / Next.js / Vue
        ts_ls = {
          filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
          root_dir = util.root_pattern("package.json", "tsconfig.json", "vue.config.*", ".git"),
          settings = {
            typescript = {
              format = { semicolons = "remove" },
            },
            javascript = {
              format = { semicolons = "remove" },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath("data")
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
              },
            },
          },
        },
        eslint = {},
        tailwindcss = {},
        jsonls = {},

        -- Astro framework
        astro = {
          cmd = { "astro-ls", "--stdio" },
          filetypes = { "astro" },
          root_dir = util.root_pattern("astro.config.*", "package.json", ".git"),
        },

        -- XML
        lemminx = {
          filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
          root_dir  = util.root_pattern("*.xml", "*.svg", ".git"),
          settings = {
            xml = {
              format = {
                splitAttributes = true,
                spaceBeforeEmptyCloseTag = true,
              },
            },
          },
        },

        -- HTML / CSS / JSON / Markdown / TOML / YAML
        html = {},
        cssls = {},
        jsonls = {},
        marksman = {},
        taplo = {},
        yamlls = {},
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
