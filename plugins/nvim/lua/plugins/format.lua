return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        astro        = { "prettierd", "prettier" },
        bash         = { "shfmt" },
        cs           = { "csharpier" },
        css          = { "prettierd", "prettier", "stylelint" },
        go           = { "gofumpt", "goimports" },
        html         = { "prettierd", "prettier" },
        javascript   = { "prettierd", "prettier" },
        json         = { "prettierd", "prettier", "jq" },
        lua          = { "stylua" },
        markdown     = { "prettierd", "prettier" },
        php          = { "php_cs_fixer" },
        python       = { "black" },
        ruby         = { "rubocop" },
        rust         = { "rustfmt" },
        sql          = { "sqlfluff", "sqlfmt" },
        swift        = { "swiftformat" },
        toml         = { "taplo" },
        typescript   = { "prettierd", "prettier" },
        vue          = { "prettierd", "prettier" },
        xml          = { "xmllint" },
        yaml         = { "prettierd", "prettier" },
      }
    },
  },
}
