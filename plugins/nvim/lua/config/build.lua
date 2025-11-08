-- setup keybinding for building projects
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.keymap.set("n", "<leader>mb", ":Build<CR>", { desc = "Build code" })
  end,
})

local M = {}

-- detect build command based on file type
function M.get_build_command()
  local fname = vim.api.nvim_buf_get_name(0)
  local ft = vim.bo.filetype
  local root = vim.lsp.buf.list_workspace_folders()[1] or vim.loop.cwd()

  if ft == "lua" then
    return "luacheck " .. fname
  elseif ft == "swift" then
    if vim.fn.filereadable(root .. "/Package.swift") == 1 then
      return "swift build"
    elseif vim.fn.glob(root .. "/*.xcodeproj") ~= "" then
      return "xcodebuild -quiet"
    end
  elseif ft == "cs" then
    return "dotnet build"
  elseif ft == "go" then
    return "go build ./..."
  elseif ft == "python" then
    return "python3 -m py_compile " .. fname
  elseif ft == "php" then
    return "php -l " .. fname
  elseif ft == "ruby" then
    return "ruby -c " .. fname
  elseif ft == "javascript" or ft == "typescript" then
    if vim.fn.filereadable(root .. "/package.json") == 1 then
      return "npm run build"
    elseif vim.fn.filereadable(root .. "/bun.lockb") == 1 then
      return "bun run build"
    elseif vim.fn.filereadable(root .. "/yarn.lock") == 1 then
      return "yarn build"
    end
  elseif ft == "astro" then
    return "astro build"
  elseif ft == "vue" or ft == "html" or ft == "css" then
    return "npm run build"
  elseif ft == "rust" then
    return "cargo build"
  elseif ft == "sql" then
    return "sqlfluff lint --dialect tsql ."
  end

  return nil
end

-- command :Build uses correct tool per project
vim.api.nvim_create_user_command("Build", function()
  local cmd = M.get_build_command()
  if not cmd then
    vim.notify("No build command for this filetype", vim.log.levels.WARN)
    return
  end
  vim.cmd("make! " .. cmd)
end, {})

return M
