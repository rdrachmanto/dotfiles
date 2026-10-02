-- R.D.R.
-- NVIM Config
-- Let's try to be as vanilla as possible! (incorporating nvim's features instead of packages)
-- 2025

-- --------------------------------------------------------------
-- Early Setup Scripts 
-- --------------------------------------------------------------
-- Import utilities here
-- Require Autocommands
-- --------------------------------------------------------------

require('vim._core.ui2').enable({
  enable = true,
  cmd = {
    height = 0.5,
  },
  dialog = {
    height = 0.5,
  },
  msg = {
    height = 0.5,
    timeout = 4000,
  },
})

-- --------------------------------------------------------------
-- Defaults 
-- --------------------------------------------------------------
-- Set some default options for the following:
-- 1. Buffer elements
-- 2. Floating window
-- 3. Colorscheme
-- 4. Statusline and winbar
-- 5. LSP config
-- 6. Diagnostics
-- --------------------------------------------------------------

local o = vim.o
local g = vim.g

g.netrw_banner=0
g.netrw_browse_split=4
g.netrw_altv=1
g.netrw_liststyle=3

o.clipboard = "unnamedplus"
o.splitbelow = true
o.splitright = true

o.termguicolors=true

o.scrolloff=5
o.cursorline=true
o.number=true
o.numberwidth=3
o.relativenumber=true
o.showtabline=0

o.autoindent=true
o.expandtab=true
o.tabstop=2
o.shiftwidth=2
o.signcolumn="yes"
o.foldcolumn="0"

o.ignorecase=true
o.smartcase=true

o.winborder="solid" -- Options: single, double, rounded, solid, shadow

vim.opt.fillchars={ eob=' ' }

-- Statusline and winbar
vim.o.laststatus = 3

-- LSP
vim.cmd[[ set completeopt+=menuone,noselect,popup ]]
vim.lsp.enable({ 
  "basedpyright", 
  "bashls",
})

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


-- --------------------------------------------------------------
-- Plugins
-- --------------------------------------------------------------
-- Plugins declared via lazy.nvim
-- Very minimal, not using vim too much rn
-- --------------------------------------------------------------

vim.pack.add({"https://github.com/rdrachmanto/cisco-theme.nvim"})
require("cisco").setup({
  contrast = {
    floating_windows = true
  },
})
vim.cmd("colorscheme cisco-dark")

-- --------------------------------------------------------------
-- Keybinding 
-- --------------------------------------------------------------

-- vim.g.mapleader=";"
-- vim.g.maplocalleader=";"
--
-- utils.set_keymaps(
--   "n",
--   {"<leader>;", "Programming"},
--   {
--     {"<leader>;;", vim.lsp.buf.hover, "Documentation on cursor"},
--     {"<leader>;a", vim.lsp.buf.code_action, "Code actions"},
--     {"<leader>;i", ":lua require('scripts.custom_functions').toggle_inlay_hints()<CR>", "Toggle inlay hints"},
--     {"<leader>;d", ":lua require('scripts.custom_functions').toggle_diagnostics_float()<CR>", "Toggle diagnostics"},
--     {"<leader>;r", vim.lsp.buf.rename, "Rename symbol"},
--     {"<leader>;f", ":lua require('conform').format()<CR>", "Format buffer"},
--   }
-- )
