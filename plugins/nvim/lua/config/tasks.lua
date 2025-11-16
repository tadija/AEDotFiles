local M = {}

-- enum for clarity
local Task = {
  BUILD = "build",
  TEST = "test",
  LINT = "lint",
  FORMAT = "format"
}

-- helpers
local function elapsed(start)
  return string.format("%.2fs", (vim.loop.hrtime() - start) / 1e9)
end

local function notify_ok(task, duration)
  vim.notify(("✅ %s completed in %s"):format(task, duration), vim.log.levels.INFO)
end

local function notify_fail(task, msg)
  vim.notify(("❌ %s failed: %s"):format(task, msg or "unknown error"), vim.log.levels.ERROR)
end

-- shared detector for build / test commands
local function detect_command(kind)
  local fname = vim.api.nvim_buf_get_name(0)
  local ft = vim.bo.filetype
  local root = vim.lsp.buf.list_workspace_folders()[1] or vim.loop.cwd()

  -- helper for package-based JS projects
  local function node_script(script)
    if vim.fn.filereadable(root .. "/package.json") == 1 then
      return "npm run " .. script
    elseif vim.fn.filereadable(root .. "/bun.lockb") == 1 then
      return "bun run " .. script
    elseif vim.fn.filereadable(root .. "/yarn.lock") == 1 then
      return "yarn " .. script
    end
  end

  if kind == Task.BUILD then
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
    elseif ft == "javascript" or ft == "typescript" or ft == "astro" or ft == "vue" then
      return node_script("build")
    elseif ft == "rust" then
      return "cargo build"
    elseif ft == "sql" then
      return "sqlfluff lint --dialect tsql ."
    end

  elseif kind == Task.TEST then
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
      return vim.fn.executable("phpunit") == 1 and "phpunit"
    elseif ft == "ruby" then
      if vim.fn.filereadable(root .. "/Gemfile") == 1 then
        return "bundle exec rspec"
      elseif vim.fn.executable("rspec") == 1 then
        return "rspec"
      end
    elseif ft == "javascript" or ft == "typescript" or ft == "astro" or ft == "vue" then
      return node_script("test")
    elseif ft == "rust" then
      return "cargo test"
    elseif ft == "sql" then
      return "sqlfluff lint --dialect tsql ."
    end
  end
end

-- main task dispatcher
function M.run(kind)
  local start = vim.loop.hrtime()
  local ok, err = pcall(function()
    local handlers = {
      [Task.LINT] = function()
        require("lint").try_lint()
      end,

      [Task.FORMAT] = function()
        require("conform").format({ async = false, lsp_fallback = true })
      end,

      [Task.BUILD] = function()
        local cmd = detect_command(Task.BUILD)
        if not cmd then error("no build command found") end
        vim.cmd("make! " .. cmd)
      end,

      [Task.TEST] = function()
        local cmd = detect_command(Task.TEST)
        if not cmd then error("no test command found") end
        if cmd:find("^busted") then 
          vim.fn.system(cmd)
        else 
          vim.cmd("make! " .. cmd) 
        end
      end,
    }

    if handlers[kind] then
      handlers[kind]()
    else
      error("unknown task: " .. tostring(kind))
    end
  end)

  local duration = elapsed(start)
  if ok then notify_ok(kind, duration) else notify_fail(kind, err) end
end

-- commands
vim.api.nvim_create_user_command("TaskLint",   function() M.run(Task.LINT) end, {})
vim.api.nvim_create_user_command("TaskFormat", function() M.run(Task.FORMAT) end, {})
vim.api.nvim_create_user_command("TaskBuild",  function() M.run(Task.BUILD) end, {})
vim.api.nvim_create_user_command("TaskTest",   function() M.run(Task.TEST) end, {})

return M
