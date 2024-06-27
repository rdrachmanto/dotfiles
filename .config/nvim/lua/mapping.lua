-- Custom functions
function ToggleInlayHints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function show_diagnostics_on_cursor_hold()
  vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", border = "single" })
end

vim.g.mapleader=";"
vim.g.maplocalleader=";"

local map_opts = {
  noremap = true,
  silent = true,
}

local mapping = vim.keymap.set

mapping("n", "<leader>e", ":NvimTreeToggle<CR>", map_opts)
mapping("n", "<leader>;;", vim.lsp.buf.hover, map_opts)
mapping({"n", "v"}, "<leader>;a", vim.lsp.buf.code_action, map_opts)
mapping("n", "<leader>;i", ":lua ToggleInlayHints()<CR>", map_opts)
mapping("n", "<leader>;d", ":lua show_diagnostics_on_cursor_hold()<CR>", map_opts)
mapping("n", "<leader>;r", vim.lsp.buf.rename, map_opts)
