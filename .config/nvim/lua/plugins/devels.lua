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

-- Git signs in the gutter
local gitsigns = {
  "lewis6991/gitsigns.nvim",
  config = true
}

-- LSP Configuration
local lsp_config = {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconf = require("lspconfig")
    lspconf.basedpyright.setup {}
    lspconf.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim'}
          }
        }
      }
    }
    lspconf.hls.setup {}
    lspconf.clangd.setup {}
    lspconf.ocamllsp.setup {}
    lspconf.marksman.setup {}
  end
}

-- LSP Capabilities
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function()
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      {
        border = "single",
        title = "Documentation at point",
        max_width = 90,
      }
    )
  end
})

-- Formatter
local conform = {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "black" }
      }
    })
  end
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
      performance = { debounce = 300, },
      completion = { keywordlength = 2 },
      view = {
        docs = {
          auto_open = false
        }
      }
    })
  end,
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
  }
}

return {
  treesitter = treesitter,
  gitsigns = gitsigns,
  lsp_config = lsp_config,
  conform = conform,
  nvim_cmp = nvim_cmp
}
