local uname = vim.uv.os_uname()
local is_linux_arm64 = uname.sysname == "Linux" and uname.machine == "aarch64"

local function to_set(items)
  local ret = {}
  for _, item in ipairs(items) do
    ret[item] = true
  end
  return ret
end

local function filter_list(items, excluded)
  if type(items) ~= "table" then
    return items
  end

  return vim.tbl_filter(function(item)
    return not excluded[item]
  end, items)
end

local function filter_tool_map(tool_map, excluded)
  if type(tool_map) ~= "table" then
    return tool_map
  end

  for ft, tools in pairs(tool_map) do
    if type(tools) == "table" then
      tool_map[ft] = filter_list(tools, excluded)
    end
  end

  return tool_map
end

local mason_skip = {}
local treesitter_skip = {}
local lsp_skip_mason = {}
local runtime_skip = {}

if is_linux_arm64 then
  mason_skip = to_set({
    "clangd",
    "erb-formatter",
    "erb-lint",
    "hlint",
    "lemminx",
    "luacheck",
    "ormolu",
    "rustfmt",
    "sqls",
  })

  treesitter_skip = to_set({
    "gitcommit",
  })

  lsp_skip_mason = to_set({
    "clangd",
    "lemminx",
    "sqls",
  })
end

for tool, cmd in pairs({
  hlint = "hlint",
  luacheck = "luacheck",
  ormolu = "ormolu",
  rustfmt = "rustfmt",
}) do
  if vim.fn.executable(cmd) == 0 then
    runtime_skip[tool] = true
  end
end

if next(mason_skip) == nil and next(treesitter_skip) == nil and next(lsp_skip_mason) == nil and next(runtime_skip) == nil then
  return {}
end

return {
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = filter_list(opts.ensure_installed or {}, mason_skip)
      return opts
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = filter_list(opts.ensure_installed or {}, mason_skip)
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = filter_list(opts.ensure_installed or {}, treesitter_skip)
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      for server in pairs(lsp_skip_mason) do
        local server_opts = opts.servers[server]
        if type(server_opts) == "table" then
          server_opts.mason = false
        end
      end

      return opts
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = filter_tool_map(opts.linters_by_ft or {}, runtime_skip)
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = filter_tool_map(opts.formatters_by_ft or {}, runtime_skip)
      return opts
    end,
  },
}

