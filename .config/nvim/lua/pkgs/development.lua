return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconf = require("lspconfig")
      require('lspconfig.ui.windows').default_options.border = 'single'
      lspconf.basedpyright.setup {}
      lspconf.marksman.setup {}
      lspconf.lua_ls.setup {
        settings = { Lua = { diagnostics = { globals = {'vim'} } } }
      }
    end
  },
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
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'path' }
        }),
        performance = { debounce = 300, },
        completion = { keywordlength = 2 },
        view = {
          docs = { auto_open = false }
        }
      })
    end,
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    }
  }
}
