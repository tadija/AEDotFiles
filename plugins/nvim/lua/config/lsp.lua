local M = {}

M.on_attach = function(_, bufnr)
  local map = function(keys, func)
    vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true })
  end
  map("gd", vim.lsp.buf.definition)
  map("K", vim.lsp.buf.hover)
end

M.capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  require("blink.cmp").get_lsp_capabilities()
)

return M
