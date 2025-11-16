return {
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat" },
    keys = (function()
      -- helper that safely handles normal + visual mode
      local function codecompanion_action(action)
        local mode = vim.fn.mode()
        if mode:match("[vV]") then
          -- capture the current visual selection range
          local start_pos = vim.fn.getpos("v")
          local end_pos   = vim.fn.getpos(".")
          -- normalize order if needed
          if start_pos[2] > end_pos[2] or (start_pos[2] == end_pos[2] and start_pos[3] > end_pos[3]) then
            start_pos, end_pos = end_pos, start_pos
          end
          -- exit visual
          vim.cmd("normal! \\<Esc>")
          -- restore marks manually
          vim.fn.setpos("'<", start_pos)
          vim.fn.setpos("'>", end_pos)
          -- execute command on that range
          vim.cmd(string.format("'<,'>CodeCompanion %s", action))
        else
          vim.cmd(string.format("CodeCompanion %s", action))
        end
      end

      return {
        { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "Chat",    mode = { "n", "v" } },
        { "<leader>aa", "<cmd>CodeCompanion<cr>",     desc = "Prompt", mode = { "n", "v" } },
        { "<leader>ae", function() codecompanion_action("explain") end, desc = "Explain",        mode = { "n", "v" } },
        { "<leader>ar", function() codecompanion_action("refactor") end, desc = "Refactor",       mode = { "n", "v" } },
        { "<leader>at", function() codecompanion_action("tests") end,    desc = "Generate tests", mode = { "n", "v" } },
        { "<leader>ad", function() codecompanion_action("docs") end,     desc = "Generate docs",  mode = { "n", "v" } },
      }
    end)(),
    opts = {
      adapters = {
        openai = {
          api_key = os.getenv("OPENAI_API_KEY"),
          model = "gpt-5-codex",
        },
      },
      display = {
        chat = {
          border = "rounded",
          winblend = 10,
        },
      },
    },
  },
}
