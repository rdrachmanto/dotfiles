return {
  { "nvim-tree/nvim-web-devicons", lazy=true },
  {
     "nvim-lualine/lualine.nvim",
     config = function()
        require("lualine").setup({
          options = {
            theme = "material",
            section_separators = "",
            component_separators = "|",
          },
          sections = {
            lualine_a = {
              { "mode", color={ fg="#232323" } },
            },
            lualine_c = {
              { "filename", path=1 },
            },
            lualine_z = {
              { "location", color={ fg="#232323" } },
            },
          },
          winbar = {
            lualine_c = {{ "filename", path=1 }},
          },
          inactive_winbar = {
            lualine_c = {{ "filename", path=1 }}
          }
        })
     end
  },
}
