local M = {}

function M.toggle_inlay_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function M.toggle_diagnostics_float()
  vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", })
end

return M
