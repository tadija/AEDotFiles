-- setup keybinding for building projects
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.keymap.set("n", "<leader>mt", ":Test<CR>", { desc = "Test code" })
  end,
})

local M = {}

-- detect test command based on file type
function M.get_test_command()
  local fname = vim.api.nvim_buf_get_name(0)
  local ft = vim.bo.filetype
  local root = vim.lsp.buf.list_workspace_folders()[1] or vim.loop.cwd()

  if ft == "lua" then
    return "busted --filter " .. vim.fn.fnamemodify(fname, ":t:r")
  elseif ft == "swift" then
    if vim.fn.filereadable(root .. "/Package.swift") == 1 then
      return "swift test"
    elseif vim.fn.glob(root .. "/*.xcodeproj") ~= "" then
      return "xcodebuild test -quiet"
    end
  elseif ft == "cs" then
    return "dotnet test"
  elseif ft == "go" then
    return "go test ./..."
  elseif ft == "python" then
    return vim.fn.executable("pytest") == 1 and "pytest" or "python3 -m unittest"
  elseif ft == "php" then
    return vim.fn.executable("phpunit") == 1 and "phpunit" or nil
  elseif ft == "ruby" then
    if vim.fn.filereadable(root .. "/Gemfile") == 1 then
      return "bundle exec rspec"
    elseif vim.fn.executable("rspec") == 1 then
      return "rspec"
    end
  elseif ft == "javascript" or ft == "typescript" or ft == "astro" or ft == "vue" then
    if vim.fn.filereadable(root .. "/package.json") == 1 then
      return "npm test"
    elseif vim.fn.filereadable(root .. "/yarn.lock") == 1 then
      return "yarn test"
    elseif vim.fn.filereadable(root .. "/bun.lockb") == 1 then
      return "bun test"
    end
  elseif ft == "rust" then
    return "cargo test"
  elseif ft == "sql" then
    return "sqlfluff lint --dialect tsql ."
  end

  return nil
end

-- Command :Test runs appropriate command in quickfix
vim.api.nvim_create_user_command("Test", function()
  local cmd = M.get_test_command()
  if not cmd then
    vim.notify("No test command for this filetype", vim.log.levels.WARN)
    return
  end
  vim.cmd("make! " .. cmd)
end, {})

return M
