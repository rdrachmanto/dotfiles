local M = {}

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
