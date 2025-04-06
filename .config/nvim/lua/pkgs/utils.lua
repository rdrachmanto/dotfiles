return {
  { "HiPhish/rainbow-delimiters.nvim", },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true, },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      icons = { rules = false },
      win = {
        border = "single",
        no_overlap = true,
        padding = { 0, 0 },
      },
    },
  }
}
