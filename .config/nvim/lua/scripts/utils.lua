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

function M.set_keymaps(mode, keymapl)
  for _, keymap in ipairs(keymapl) do
    vim.keymap.set(mode, keymap[1], keymap[2], keymap[3])
  end
end

return M
