local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- color scheme
-- replicate tangonov theme's colors from my emacs config
config.color_scheme = "Material Darker (base16)"
config.colors = {
  background = "#151515"
}

-- fonts
config.font = wezterm.font 'JetBrains Mono Nerd Font'
config.font_size = 9.0

-- tabs
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

return config
