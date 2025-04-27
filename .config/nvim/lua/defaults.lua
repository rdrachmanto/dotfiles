local o = vim.o
local g = vim.g

g.netrw_banner=0
g.netrw_browse_split=4
g.netrw_altv=1
g.netrw_liststyle=3

o.clipboard = unnamedplus
o.splitbelow = true
o.splitright = true

o.termguicolors=true

o.scrolloff=5
o.cursorline=true
o.number=true
o.numberwidth=3
o.relativenumber=true
o.showtabline=2

o.autoindent=true
o.expandtab=true
o.tabstop=2
o.shiftwidth=2
o.signcolumn="yes"
o.foldcolumn="1"

o.ignorecase=true
o.smartcase=true

o.winborder="none" -- Options: single, double, rounded, solid, shadow

vim.opt.fillchars={ eob=' ' }

-- Colorscheme
vim.cmd("colorscheme cisco")

-- Statusline and winbar
vim.o.laststatus = 3
vim.o.winbar = " %t %{%v:lua.require'nvim-navic'.get_location()%}"

-- Diagnostic signs
vim.diagnostic.config({
  virtual_text = false,
  underline = {
    severity = {
      min = vim.diagnostic.severity.HINT,
    }
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "▲",
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
