return {
  'wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { "gS", function() require("treesj").split() end, desc = "Split lines" },
    { "gJ", function() require("treesj").join() end, desc = "Join lines" },
    { "gM", function() require("treesj").toggle() end, desc = "Toggle lines" },
  },
}
