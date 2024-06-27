return {
  "marko-cerovac/material.nvim",
  init=function()
    vim.g.material_style="darker"
  end,
  config=function()
    require("material").setup({
      lualine_style="default", -- options: "default" or "stealth"
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

      -- Re-enable cursorline highlighting
      vim.api.nvim_exec([[
        hi CursorLine cterm=NONE guibg=#232323
      ]], false)
   end
}
