-- Icons and themes
local web_devicons = require("plugins.icons")
local material_theme = require("plugins.colorscheme")

-- UI Enhancements
local lualine = require("plugins.lualine")

-- File tree
local nvim_tree = require("plugins.nvim_tree")

-- Niceties 
local niceties = require("plugins.niceties")
local autopairs = niceties.autopairs
local comment = niceties.autopairs
local which_key = niceties.which_key
local rainbow_delimiters = niceties.rainbow_delimiters

-- Telescope for pickers
local telescope = require("plugins.telescope")

-- Development / Programming related packages
local devels = require("plugins.devels")
local lsp_config = devels.lsp_config
local treesitter = devels.treesitter
local nvim_cmp = devels.nvim_cmp
local gitsigns = devels.gitsigns
local conform = devels.conform

-- Set up lazy.nvim package manager
-- Load package from package definitions
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local packages = {
   web_devicons,
   material_theme,
   nvim_tree,
   lualine,
   autopairs,
   which_key,
   treesitter,
   lsp_config,
   nvim_cmp,
   telescope,
   rainbow_delimiters,
   comment,
   gitsigns,
   conform
}

local lazy_options = {
  ui = {
    border = "single"
  }
}
require("lazy").setup(packages, lazy_options)
