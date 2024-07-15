local M = {}

local function display_cur_mode()
  local cur_mode = vim.api.nvim_get_mode().mode
  local mode_displ = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["nov"] = "NORMAL",
    ["noV"] = "NORMAL",
    ["i"] = "INSERT",
    ["v"] = "VISUAL",
    ["V"] = "V-LINE",
    ["\22"] = "V-BLOCK",
    ["c"] = "COMMAND",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
  }

  return mode_displ[cur_mode] or "UNKNOWN"
end

local function with_diagnostics_info()
  local counts = {
    ["1"] = 0,
    ["2"] = 0,
  }

  local diagnostics = vim.diagnostic.get(0)
  if next(diagnostics) ~= nil then
    for _, d in ipairs(diagnostics) do
      if d.severity == 1 then
        counts["1"] = counts["1"] + 1
      end

      if d.severity == 2 then
        counts["2"] = counts["2"] + 1
      end
    end
  end

  return "E:" .. counts["1"] .. " W:" .. counts["2"]
end

function M.build_statusline()
  local statusline = table.concat({
    " ",
    display_cur_mode(),
    " | ",
    "%{luaeval('vim.b.gitsigns_head')}",
    " | ",
    with_diagnostics_info(),
    "%=%f %m",
    "%=%l:%c ",
  })
  return statusline
end

return M
