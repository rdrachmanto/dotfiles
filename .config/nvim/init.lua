local o = vim.o
local g = vim.g

o.termguicolors=true

o.scrolloff=5
o.cursorline=true
o.number=true
vim.wo.relativenumber=true

o.autoindent=true
o.expandtab=true
o.tabstop=2
o.shiftwidth=2

o.ignorecase=true
o.smartcase=true

vim.opt.fillchars={ eob=' ' }
g.loaded_netrw= 1
g.loaded_netrwPlugin=1

vim.g.mapleader=" "
vim.g.maplocalleader=" "

local web_devicons = { "nvim-tree/nvim-web-devicons", lazy=true }

local material_theme = {
   "marko-cerovac/material.nvim",
   init=function()
      g.material_style="darker"
   end,
   config=function()
      require("material").setup({
            lualine_style="stealth", -- or "stealth"
            plugins={
               "which-key",
               "nvim-tree",
            },
            contrast = {
              sidebars = true,
              cursor_line = true,
              floating_windows = true,
            },
            disable = {
              background = true 
            }
          })
      vim.cmd "colorscheme material"
   end
}

local nvim_tree = { "nvim-tree/nvim-tree.lua", config=true }

local lualine = {
   "nvim-lualine/lualine.nvim",
   config = function()
      require("lualine").setup({
            options = {
               theme = "material",
               section_separators = "",
               component_separators = "|",
               disabled_filetypes = {"NvimTree"}
            }})
   end
}

local autopairs = {
  "windwp/nvim-autopairs", 
  event = "InsertEnter",
  config = true,
}

local which_key = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
      o.timeout = true
      o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup({
      window = {
        border = {"", "-", "", "", "", "-", "", ""},  -- Vertical borders only
      }
    })
  end,
}

local treesitter = {
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
}

local lsp_config = {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconf = require("lspconfig")
    lspconf.pyright.setup {}
    lspconf.clangd.setup {}
  end
}

local luasnip = {
  "L3MON4D3/LuaSnip",
}

local cmp_nvim_lsp = {
  "hrsh7th/cmp-nvim-lsp",
}

local cmp_path = {
  "hrsh7th/cmp-path",
}


local cmp_buffer = {
  "hrsh7th/cmp-buffer",
}

local nvim_cmp = {
  "hrsh7th/nvim-cmp",
  config = function() 
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' },
        { name = 'path' }
      }),
      performance = {
        debounce = 300,
      },
      completion = {
        keywordlength = 2
      },
      view = {
        docs = {
          auto_open = false
        }
      }
    })
  end 
}

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
   cmp_nvim_lsp,
   cmp_path,
   cmp_buffer,
   nvim_cmp,
   luasnip
}

local lazy_options = {}

require("lazy").setup(packages, lazy_options)

local default_keymap_options = {
  noremap = true,
  silent = true,
}

local mapping = vim.keymap.set

mapping("n", "<leader>e", ":NvimTreeToggle<CR>", default_keymap_options)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    mapping({"n", "v"}, "<leader>;a", vim.lsp.buf.code_action, opts)
    mapping("n", "<leader>;r", vim.lsp.buf.rename, opts)
    mapping("n", "<leader>k", vim.lsp.buf.hover, opts)

    -- Another way to set the keybinds
    -- As stated above, nvim_set_keymap() cannot take lua functions directly
    -- This is the example of the workaround
    -- vim.api.nvim_set_keymap("n", "<leader>cd", "<cmd>lua vim.lsp.buf.hover() <cr>", {noremap = true, silent = true})

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = "single" }
    )
  end
})
