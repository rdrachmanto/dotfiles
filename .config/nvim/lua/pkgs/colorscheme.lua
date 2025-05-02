return {
  -- {
  --   "marko-cerovac/material.nvim",
  --   init=function()
  --     vim.g.material_style="darker"
  --   end,
  --   config=function()
  --     require("material").setup({
  --       lualine_style="default", -- options: "default" or "stealth"
  --       plugins={
  --         "which-key",
  --         "nvim-tree",
  --       },
  --       contrast = {
  --         sidebars = true,
  --         cursor_line = true,
  --         floating_windows = true,
  --       },
  --       disable = {
  --         background = true
  --       }
  --     })
  --
  --     vim.cmd "colorscheme material"
  --
  --     -- Re-enable cursorline highlighting
  --     vim.api.nvim_exec([[
  --       hi MsgArea cterm=NONE guibg=NONE guifg=#878580
  --       hi StatusLine cterm=NONE guibg=NONE guifg=#878580
  --       hi WinBar cterm=NONE guibg=#303030
  --       hi WinBarNC cterm=NONE guifg=#303030 guibg=NONE
  --       hi CursorLine cterm=NONE guibg=#101010
  --       hi TabLineSel cterm=NONE guifg=#303030
  --       hi FzfLuaFzfPointer cterm=NONE guifg=#151515
  --       hi FzfLuaFzfGutter cterm=NONE guibg=#151515 
  --       hi FzfLuaFzfScrollbar cterm=NONE guifg=#303030
  --       hi FzfLuaFzfScrollbar cterm=NONE guifg=#303030
  --       hi FzfLuaCursorLine cterm=NONE guibg=#303030
  --       hi FzfLuaFzfCursorLine cterm=NONE guibg=#303030
  --       hi FzfLuaBorder cterm=NONE guifg=#303030
  --     ]], false)
  --  end
  -- }
  {
    "rdrachmanto/cisco-theme.nvim"
  }
}
