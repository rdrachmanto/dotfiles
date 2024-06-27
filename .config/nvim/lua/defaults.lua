local o = vim.o
local g = vim.g

o.termguicolors=true

o.scrolloff=5
o.cursorline=true
o.number=true
o.numberwidth=3
o.relativenumber=true

o.autoindent=true
o.expandtab=true
o.tabstop=2
o.shiftwidth=2
o.signcolumn="yes"

o.ignorecase=true
o.smartcase=true

vim.opt.fillchars={ eob=' ' }
g.loaded_netrw= 1
g.loaded_netrwPlugin=1

-- Statusline and winbar
vim.opt.laststatus = 3

-- Diagnostic signs
vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "●",
      [vim.diagnostic.severity.WARN] = "●",
      [vim.diagnostic.severity.INFO] = "○",
      [vim.diagnostic.severity.HINT] = "○",
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    }
  }
})
