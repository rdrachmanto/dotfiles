local M = {}

function M.set_winbar()
  local winbar_fmt = {
    " ",
    "%t",
    " "
  }

  if vim.api.nvim_get_current_win() == vim.api.nvim_get_current_win() then
    table.insert(winbar_fmt, "%{%v:lua.require'nvim-navic'.get_location()%}")
  end

  return table.concat(winbar_fmt, "")
end

return M
