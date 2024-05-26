local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- color scheme
-- replicate tangonov theme's colors from my emacs config
config.color_scheme = "Material Darker (base16)"
config.colors = {
  cursor_bg = "#ffca41",
  background = "#151514",
  tab_bar = {
    background = "#151515",
    active_tab = {
      bg_color = "#232323",
      fg_color = "#EEFFFF",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#232323",
      fg_color = "#626262"
    },
    inactive_tab_hover = {
      bg_color = "#232323",
      fg_color = "#626262",
      italic = true,
    },
    new_tab = {
      bg_color = "#232323",
      fg_color = "#626262"
    },
    new_tab_hover = {
      bg_color = "#232323",
      fg_color = "#626262",
      italic = true,
    },
  }
}

-- scrollbar setting
config.enable_scroll_bar = false 

-- window padding
config.window_padding = {
  top = 6,
  left = 4,
  right = 2,
  bottom = 0,
}

-- fonts
config.font = wezterm.font 'JetBrains Mono Nerd Font'
config.font_size = 9.5

-- tabs
config.tab_bar_at_bottom = true 
config.use_fancy_tab_bar = false


return config
