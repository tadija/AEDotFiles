return {
  'saghen/blink.cmp',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      list = { selection = { preselect = false, auto_insert = false } },
      menu = {
        auto_show = false,
        -- auto_show_delay_ms = 500,
        border = 'single',
      },
      documentation = { window = { border = 'single' } },
    },
    signature = { window = { border = 'single' } },
    sources = {
      providers = {
        cmdline = {
          -- ignores cmdline completions when executing shell commands (avoid hang on WSL)
          enabled = function()
            return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
          end
        }
      }
    },
  },
}
