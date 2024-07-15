local utils = require("scripts.utils")

vim.g.mapleader=";"
vim.g.maplocalleader=";"

-- Code related keymaps
utils.set_keymaps(
  "n",
  {"<leader>;", "Programming"},
  {
    {"<leader>;;", vim.lsp.buf.hover, "Documentation on cursor"},
    {"<leader>;a", vim.lsp.buf.code_action, "Code actions"},
    {"<leader>;i", ":lua require('scripts.custom_functions').toggle_inlay_hints()<CR>", "Toggle inlay hints"},
    {"<leader>;d", ":lua require('scripts.custom_functions').toggle_diagnostics_float()<CR>", "Toggle diagnostics"},
    {"<leader>;r", vim.lsp.buf.rename, "Rename symbol"},
    {"<leader>;f", ":lua require('conform').format()<CR>", "Format buffer"},
  }
)

-- Nvim CMP
-- Can be placed in the config, but placed here to conform with grouping
local cmp_maps = require("cmp").mapping
require("cmp").setup({
  mapping = {
    ['<Tab>'] = cmp_maps.select_next_item(),
    ['<S-Tab>'] = cmp_maps.select_prev_item(),
    ['<CR>'] = cmp_maps.confirm({ select = true }),
  }
})
