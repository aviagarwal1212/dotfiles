-- Pull in wezterm API
local wezterm = require 'wezterm'

-- Table to hold the configuration
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Set the color scheme
config.color_scheme = "OneDark (Gogh)"

-- Set the font options
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 15.0
config.line_height = 1.2
config.bold_brightens_ansi_colors = "BrightOnly"
config.default_cursor_style = "SteadyBar"

-- Window-related settings
config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"




return config
