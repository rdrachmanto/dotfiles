return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconf = require("lspconfig")
      require('lspconfig.ui.windows').default_options.border = 'single'
      lspconf.basedpyright.setup {}
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
  }
}
