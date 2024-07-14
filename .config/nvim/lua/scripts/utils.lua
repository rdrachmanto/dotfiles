local M = {}

function M.package_loader(pkgl)
  local packages = {}
    for _, pkg in ipairs(pkgl) do
      table.insert(packages, pkg)
    end
    return packages
end

return M
