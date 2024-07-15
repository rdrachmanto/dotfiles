local M = {}

function M.package_loader(...)
  local args = {...}
  local packages = {}
  for _, pkgl in ipairs(args) do
    for _, pkg in ipairs(pkgl) do
      table.insert(packages, pkg)
    end
  end

  return packages
end

function M.set_keymaps(mode, group, keymapl)
  local wk = require("which-key")

  -- for group 
  wk.add({group[1], group=group[2]})

  -- keymaps of group
  for _, keymap in ipairs(keymapl) do
    wk.add({keymap[1], keymap[2], desc=keymap[3], mode=mode})
  end
end

return M
