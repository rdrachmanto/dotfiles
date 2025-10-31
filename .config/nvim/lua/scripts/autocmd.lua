local statusline_evts = {
  "VimEnter",
  "BufEnter",
  "ModeChanged",
  "LspAttach",
  "LspRequest",
}

vim.api.nvim_create_autocmd({"BufEnter", "VimEnter"}, {
  callback = function ()
    vim.opt.winbar = require("scripts.winbar").set_winbar()
  end
})
