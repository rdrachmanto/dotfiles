local statusline_evts = {
  "VimEnter",
  "BufEnter",
  "ModeChanged",
  "LspAttach",
  "LspRequest",
}

vim.api.nvim_create_autocmd(statusline_evts, {
  callback = function ()
    vim.opt.statusline = require("scripts.statusline").build_statusline()
  end
})

vim.api.nvim_create_autocmd({"BufEnter", "VimEnter"}, {
  callback = function ()
    vim.opt.winbar = require("scripts.winbar").set_winbar()
  end
})
