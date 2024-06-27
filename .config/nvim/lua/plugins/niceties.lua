local autopairs = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
}

local comment = { "numToStr/Comment.nvim", opts = {} }

local which_key = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup({
      window = {
        border = "double"
      }
    })
  end,
}

local rainbow_delimiters = { "HiPhish/rainbow-delimiters.nvim", }

return {
  autopairs = autopairs,
  comment = comment,
  which_key = which_key,
  rainbow_delimiters = rainbow_delimiters
}
