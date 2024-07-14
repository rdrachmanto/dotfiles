-- Ensure lazy is set up
require("packages.lazy-setup")
local utils = require("scripts.utils")

-- Load the packages
local ui = require("packages.ui")
local development = require("packages.development")
local colorscheme = require("packages.colorscheme")
local filemgt = require("packages.file-explorer")
local ut = require("packages.utils")
local vc = require("packages.vc")
local finder = require("packages.finder")


local packages = {}
local uipkg = utils.package_loader(ui)
local dpkg = utils.package_loader(development)
local fpkg = utils.package_loader(filemgt)
local utpkg = utils.package_loader(ut)
local vcpkg = utils.package_loader(vc)
local fipkg = utils.package_loader(finder)
local cpkg = utils.package_loader(colorscheme)


vim.list_extend(packages, uipkg)
vim.list_extend(packages, dpkg)
vim.list_extend(packages, fpkg)
vim.list_extend(packages, utpkg)
vim.list_extend(packages, vcpkg)
vim.list_extend(packages, fipkg)
vim.list_extend(packages, cpkg)

require("lazy").setup(packages, {
  ui = { border = "single" }
})
