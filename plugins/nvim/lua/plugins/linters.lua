return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        astro        = { "eslint_d", "eslint" },
        bash         = { "shellcheck" },
        cs           = {}, -- OmniSharp handles analyzers
        css          = { "stylelint" },
        go           = { "golangci_lint" },
        html         = { "eslint_d", "eslint" },
        javascript   = { "eslint_d", "eslint" },
        json         = { "jsonlint" },
        lua          = { "luacheck" },
        markdown     = { "markdownlint" },
        php          = { "phpstan" },
        python       = { "flake8" },
        ruby         = { "rubocop" },
        rust         = { "clippy" },
        sql          = { "sqlfluff" },
        swift        = { "swiftlint" },
        toml         = { "taplo" },
        typescript   = { "eslint_d", "eslint" },
        vue          = { "eslint_d", "eslint" },
        xml          = { "xmllint" },
        yaml         = { "yamllint" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
