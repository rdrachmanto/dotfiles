local utils = require("scripts.utils")

vim.g.mapleader=";"
vim.g.maplocalleader=";"

function source_config()
  vim.cmd("source $MYVIMRC")
  print("Config reloaded")
end

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

utils.set_keymaps(
  "n",
  { "<leader>c", "Config" },
  {
    {"<leader>cc", source_config, "Reload configuration"}
  }
)
