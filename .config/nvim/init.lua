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

local utils = require("scripts.utils")
require("scripts.autocmd")

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
-- o.showtabline=2

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
  "janet_lsp",
  "metals"
})
vim.lsp.config("*", {
  root_markers = { ".git" },
  on_attach = function(client, bufnr)
    -- Trigger autocompletion, always
    -- Might be slow
    -- local chars = {}
    -- for i = 32, 126 do
    --   table.insert(chars, string.char(i))
    -- end
    -- More conservative autocompletion
    -- local chars = {
    --   ".", "("
    -- }
    -- client.server_capabilities.completionProvider.triggerCharacters = chars
    -- vim.lsp.completion.enable(true, client.id, bufnr, {
    --   autotrigger = true,
    --   convert = function(item)
    --     return { abbr = item.label:gsub('%b()', '') }
    --   end,
    -- })
    vim.o.winbar = "%t %{%v:lua.require'nvim-navic'.get_location()%}"
  end,
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
-- Total: 12 plugins. I work, I don't live in a basement.
-- --------------------------------------------------------------

require("scripts.lazy-setup")

local ui_pkgs = {
  { "nvim-tree/nvim-web-devicons", lazy=true },
  {
    "SmiteshP/nvim-navic",
    config = {
      lsp = { auto_attach = true }
    }
  }
}

local devel_pkgs = {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = { enable = true },
      })
    end
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "ruff_format" }
        }
      })
    end
  },
  {
    'saghen/blink.cmp',
    version = "1.*",
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        nerd_font_variant = "normal",
      },
      completion = {
        documentation = { auto_show = false },
        menu = {
          scrollbar = false,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap=1 }
            },
            treesitter = { "lsp" }
          }
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false
          }
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" }
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  { "HiPhish/rainbow-delimiters.nvim", },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true, },
  { "lewis6991/gitsigns.nvim", config = true },
}

local util_pkgs = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",  -- Options "classic", "modern", "helix"
      icons = { rules = false },
      win = {
        no_overlap = true,
        padding = { 1, 2 },
        border = "none",
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    config = function ()
      require("fzf-lua").setup({
        "fzf-native",
        fzf_colors = true,
        winopts = {
          backdrop = 60,
          border = vim.o.winborder,
          preview = {
            default = "cat",
            border = vim.o.winborder,
            delay = 250,
          }
        },
        previewers = {
          cat = {}
          -- bat = {
          --   cmd = "bat",
          --   theme = "Material-Dark"
          -- }
        }
      })
    end
  }
}

local colorschemes = {
  {
    "rdrachmanto/cisco-theme.nvim",
    config = function()
      require("cisco").setup({
        contrast = {
          floating_windows = true 
        },
      })
      vim.cmd.colorscheme("cisco")
    end
  },
  -- {
  --   dir = "~/Devel/cisco-dark-dark-theme.nvim",
  --   name = "cisco-dark-dark-theme.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("cisco-dark-dark").setup({
  --       contrast = {
  --         floating_windows = true 
  --       },
  --     })
  --     vim.cmd.colorscheme("cisco-dark-dark")
  --   end,
  -- }
}

local enabled_pkgs = utils.package_loader(
  ui_pkgs, devel_pkgs, util_pkgs, colorschemes
)
require("lazy").setup({
  enabled_pkgs
})


-- --------------------------------------------------------------
-- Keybinding 
-- --------------------------------------------------------------

vim.g.mapleader=";"
vim.g.maplocalleader=";"

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
