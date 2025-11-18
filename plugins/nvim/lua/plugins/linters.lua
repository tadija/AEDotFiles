return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        astro = { "eslint_d", "eslint" },
        bash = { "shellcheck" },
        css = { "stylelint" },
        elixir = { "credo" },
        fortran = { "fortls" },
        go = { "golangci_lint" },
        haskell = { "hlint" },
        html = { "eslint_d", "eslint" },
        java = { "checkstyle" },
        javascript = { "eslint_d", "eslint" },
        json = { "jsonlint" },
        kotlin = { "ktlint" },
        lua = { "luacheck" },
        markdown = { "markdownlint" },
        php = { "phpstan" },
        python = { "flake8" },
        perl = { "perl" },
        ruby = { "rubocop" },
        rust = { "clippy" },
        scala = { "scalac" },
        sql = { "sqlfluff" },
        swift = { "swiftlint" },
        toml = { "taplo" },
        typescript = { "eslint_d", "eslint" },
        vue = { "eslint_d", "eslint" },
        xml = { "xmllint" },
        yaml = { "yamllint" },
        zig = { "zig" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
