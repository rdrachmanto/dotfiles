return {
  { "numToStr/Comment.nvim", opts = {} },
  { "HiPhish/rainbow-delimiters.nvim", },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true, },
  {
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
}
