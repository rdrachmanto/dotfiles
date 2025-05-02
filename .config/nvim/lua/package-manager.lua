-- Ensure lazy is set up
require("pkgs.lazy-setup")
local utils = require("scripts.utils")

-- Load the pkgs
local ui = require("pkgs.ui")
local development = require("pkgs.development")
local colorscheme = require("pkgs.colorscheme")
local ut = require("pkgs.utils")
local vc = require("pkgs.vc")
local finder = require("pkgs.finder")


local pkgs = utils.package_loader(
  ui, development, ut, vc, finder, colorscheme
)

require("lazy").setup(pkgs, {
  ui = { border = "single" }
})
