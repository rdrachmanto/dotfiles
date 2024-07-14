local utils = require("scripts.utils")

function show_diagnostics_on_cursor_hold()
  vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", border = "single" })
end

vim.g.mapleader=";"
vim.g.maplocalleader=";"

local map_opts = {
  noremap = true,
  silent = true,
}

utils.set_keymaps("n", {
  {"<leader>;;", vim.lsp.buf.hover, map_opts},
  {"<leader>;a", vim.lsp.buf.code_action, map_opts},
  {"<leader>;i", ":lua require('scripts.custom_functions').toggle_inlay_hints()<CR>", map_opts},
  {"<leader>;d", ":lua require('scripts.custom_functions').toggle_diagnostics_float()<CR>", map_opts},
  {"<leader>;r", vim.lsp.buf.rename, map_opts}
})
