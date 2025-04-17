local c = {
  black1  = "#0e100f",
  black2  = "#1e201f",
  black3  = "#1f211f",
  black4  = "#403e3c",
  black5  = "#878580",
  black6  = "#a0a0a0",

  light1  = "#f8f8f8",
  light2  = "#cecdc3",

  blue1   = "#2b5375",
  blue2   = "#3aa99f",
  blue3   = "#4385be",
  blue4   = "#5b79e3",
  blue5   = "#79b8ff",
  blue6   = "#8caec1",

  green   = "#879a39",

  yellow1 = "#ad8301",
  yellow2 = "#d0a215",
  yellow3 = "#f3cd07",

  orange1 = "#da702c",
  orange2 = "#fe9900",
  orange3 = "#ffab70",
  orange4 = "#ffc799",

  purple1 = "#b392f1",
  purple2 = "#e394dc",

  pink    = "#fa7584",

  red1    = "#d14d41",
  red2    = "#d3604f"
}

vim.o.background = "dark"

vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "cisco"

local set = vim.api.nvim_set_hl

set(0, "Normal", { fg = c.light2, bg = c.black1 })

set(0, "TabLine", { fg = c.black5, bg = c.black1 })
set(0, "TabLineSel", { fg = c.black5, bg = c.black1 })
set(0, "WinBar", { fg = c.black5, bg = c.black1 })
set(0, "WinBarNC", { fg = c.black5, bg = c.black1 })
set(0, "WinSeparator", { fg = c.black4 })
set(0, "CursorLine", { bg = c.black4 })
set(0, "CursorLineNr", { fg = c.orange2 })
set(0, "StatusLine", { fg = c.black5, bg = c.black1 })
set(0, "MsgArea", { fg = c.black5 })

set(0, "Type", { fg = c.blue5 })
set(0, "@string.escape", { fg = c.pink })
set(0, "Number", { fg = c.light1 })
set(0, "@string.regexp", { fg = c.black6 })
set(0, "String", { fg = c.orange3 })
set(0, "Special", { fg = c.blue5 })
set(0, "Comment", { fg = c.black5 })
set(0, "Statement", { fg = c.pink })
set(0, "WarningMsg", { fg = c.orange1 })
set(0, "Constant", { fg = c.blue5 })
set(0, "Operator", { fg = c.pink })
set(0, "Delimiter", { fg = c.light2 })
set(0, "@markup", { fg = c.black5 })
set(0, "@punctuation", { fg = c.light2 })
set(0, "PreProc", { fg = c.orange4 })
set(0, "Identifier", { fg = c.light2 })
set(0, "@variable", { fg = c.light2 })
set(0, "Function", { fg = c.purple1 })
set(0, "@property", { fg = c.light2 })
