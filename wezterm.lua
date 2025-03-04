local function win_require(modulename)
  local errmsg = ""
  -- Convert forward slashes to backslashes
  local modulepath = string.gsub(modulename, "/", "\\")
  -- Define the base path where your modules are located
  local base_path = "C:\\Users\\eristocrates\\.config\\wezterm\\wezterm_modules\\"
  -- Construct the full path to the module
  local filename = base_path .. modulepath .. ".lua"

  -- Try to open the file
  local file = io.open(filename, "rb")
  if file then
    -- Compile and return the module
    local chunk = assert(load(assert(file:read("*a")), filename))
    file:close()
    return chunk
  end
  errmsg = errmsg .. "\n\tno file '" .. filename .. "' (checked with custom loader)"
  return errmsg
end

-- Install the custom loader
table.insert(package.searchers, 2, win_require)

-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local session_manager = win_require("wezterm-session-manager/session-manager")
-- This will hold the configuration.
local config = wezterm.config_builder()

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

wezterm.on("save_session", function(window) session_manager.save_state(window) end)
wezterm.on("load_session", function(window) session_manager.load_state(window) end)
wezterm.on("restore_session", function(window) session_manager.restore_state(window) end)

-- This is where you actually apply your config choices

-- from https://es.pixilart.com/palettes/shadow-the-hedgehog-color-80734

local color_reference               = {
  -- Bright yellows
  yellow_bright_1 = "#FAFE00",
  yellow_bright_2 = "#FBFE00",
  yellow_bright_3 = "#FBFF01",
  yellow_bright_4 = "#FBFE01",
  yellow_bright_5 = "#FAFD01",

  -- Light pinks/reds
  pink_light_1 = "#FFC1C0",
  pink_light_2 = "#FFC1C1",

  -- Dark browns/blacks
  brown_dark_1 = "#251C1B",
  black_metal = "#060403",
  brown_dark_2 = "#241B1B",
  black_dark_2 = "#050303",
  brown_dark_3 = "#241710",
  italian_roast = "#240A09",
  brown_dark_4 = "#240A09",

  -- Reds
  red_alert = "#E0372D",
  red_bright_1 = "#FF3E33",
  red_dark_1 = "#C02F27",
  red_bright_2 = "#FF3D33",
  red_dark_2 = "#C02E27",
  red_bright_3 = "#E0362D",
  red_dark_3 = "#C02E27",

  -- Oranges
  orange_light_1 = "#FDD484",
  orange_light_2 = "#FDD384",
  orange_light_3 = "#FDD385",
  orange_light_4 = "#FCD285",
  orange_light_5 = "#FCD286",
  orange_light_6 = "#FCD186",
  orange_light_7 = "#FCC97E",

  -- Yellows
  yellow_bright_6 = "#FAFC02",
  yellow_bright_7 = "#FAFC03",
  yellow_bright_8 = "#F9FA03",
  yellow_bright_9 = "#F9FA04",
  yellow_bright_10 = "#F9F904",
  yellow_bright_11 = "#F8F805",
  yellow_bright_12 = "#F8F706",
  yellow_bright_13 = "#F7F506",
  yellow_bright_14 = "#F7F507",
  yellow_bright_15 = "#F7F408",
  yellow_bright_16 = "#F7F508",
  yellow_bright_17 = "#F6F308",
  yellow_bright_18 = "#F6F309",
  yellow_bright_19 = "#F6F20A",
  yellow_bright_20 = "#F5F00A",

  -- Light browns
  brown_light_1 = "#633E2A",
  brown_light_2 = "#825237",
  brown_light_3 = "#A16544",
  brown_light_4 = "#C07951",
  brown_light_5 = "#442B1D",
  brown_light_6 = "#44120F",
  brown_light_7 = "#631915",
  brown_light_8 = "#633E2A",

  -- Pinks
  pink_light_3 = "#FFB5B5",
  pink_light_4 = "#C08888",
  pink_light_5 = "#A17979",
  pink_light_6 = "#C09191",
  pink_light_7 = "#E0A9A9",

  -- Grays
  gray_dark_1 = "#443333",
  gray_dark_2 = "#443030",

  -- Other colors
  orange_bright_1 = "#FFA16B",
  orange_bright_2 = "#E08D5E",
  red_bright_4 = "#A12721",
  red_bright_5 = "#82201B",
  brown_light_9 = "#826262",
  brown_light_10 = "#634B4B",
  brown_light_11 = "#825C5C",
  brown_light_12 = "#634646",
}

-- names from --https://colorkit.co/color/{colorCode}/
-- https://www.color-hex.com/color-palette/1048072
local red_pegasus                   = "#DC0000"
local butterscotch_cake             = "#f6c883"
local beloved_sunflower             = "#ffb528"
local inca_yellow                   = "#FFD200"
-- https://www.color-hex.com/color-palette/1025643
local bluetiful                     = "#3061e3"
local resplendent_growth            = "#319938"

-- https://www.spriters-resource.com/resources/sheets/10/10045.png?updated=1604988056
--local  = ""
local doctor                        = "#F8F8F8"
local tangled_web                   = "#b0b0b0"
local paris_paving                  = "#707070"
local lead                          = "#202020"
local kimono                        = "#7088b8"
local intergalactic                 = "#485070"
local purple_noir                   = "#303058"
local pastel_yellow                 = "#f8f898"
local pani_puri                     = "#f8a850"
local warm_brown                    = "#985010"
local red_stop                      = "#f82020"
local cacodemon_red                 = "#a00000"
local banana_propaganda             = "#f8d800"
local atomic_orange                 = "#f88808"
local pimentPiquant                 = "#d02000"

local hint_of_red                   = "#f8e0e0"
local death_by_chocolate            = "#604040"
local plum                          = "#d8a0e0"
local lusty_lavendar                = "#9060b0"
local yippie_ya_yellow              = "#f8f8a0"
local dragon_ball                   = "#f8a020"
local coral_red                     = "#f84040"
local fire_engine                   = "#f80000"
local delayed_yellow                = "#f8f800"
local sunny_yellow                  = "#f8f810"
local metroid_red                   = "#f84000"

-- original shades
local red_alert                     = "#FF1010"
local dark_matter                   = "#120303"
local federation_of_love            = "#b00d0d"
local deviled_eggs                  = "#FDD285"
local neon_boneyard                 = "#ebc1ff"
local dwarf_fortress                = "#200101"
local falu_red                      = "#82201B"
local peri_peri                     = "#C02E27"
local teal_me_no_lies               = "#0db0b0"
local bluerocratic                  = "#2f6aff"
local cherry_soda                   = "#dc0037"
local finder                        = "#00FF00"
--local finder = "#00FF00"

config.color_scheme                 = 'ow-the-edge'
config.color_schemes                = {
  ['ow-the-edge'] = {
    -- The default text color
    --[[
    kak text
    ]]
    foreground = inca_yellow,
    -- The default background color
    background = dark_matter,

    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    --[[
    excludes kak's cursor
    ]]
    cursor_bg = lead,
    -- Overrides the text color when the current cell is occupied by the cursor
    --[[
    excludes kak's cursor
    ]]
    cursor_fg = butterscotch_cake,
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = lead,

    -- the foreground color of selected text
    selection_fg = plum,
    -- the background color of selected text
    selection_bg = lead,

    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = '#222222',

    -- The color of the split lines between panes
    split = '#444444',

    ansi = {
      --[[
      base background highlight
      ]]
      'black', -- terminal:black
      --[[
      error text
      kak colon
      ]]
      bluetiful, -- terminal:red
      --[[
      links
      tmux status
      time seperators
      highlight
      ]]
      red_alert, -- terminal:green
      --[[
      kak assistant bg
      ]]
      peri_peri, -- terminal:yello
      --[[
      document selection
      text inside highlight
      table ids
      ]]
      deviled_eggs, -- terminal:blue
      --[[
      right prompt
      ]]
      falu_red, -- terminal:magenta
      --[[
      external commands
      comments
      directories
      ]]
      cherry_soda, -- terminal:cyan
      --[[
      kak command highlight
      table lines
      ]]
      federation_of_love -- terminal:white
    },

    brights = {
      --[[
      autocomplete suggestion
      ]]
      beloved_sunflower, -- terminal:brightBlack
      red_pegasus,       -- terminal:brightRed
      --[[
      left prompt
      arguments
      tab selection
      table ids
      ]]
      inca_yellow, -- terminal:brightGreen
      red_alert,   -- terminal:brightYellow
      --[[
      option
      ]]
      red_pegasus, -- terminal:brightBlue
      --[[
      error
      detail text
      ]]
      resplendent_growth, -- terminal:brightMagenta
      --[[
      internal commands
      ]]
      red_pegasus, -- terminal:brightCyan
      finder,      -- terminal:brightWhite
    },

    -- Arbitrary colors of the palette in the range from 16 to 255
    indexed = { [136] = '#af8700' },

    -- Since: 20220319-142410-0fcdea07
    -- When the IME, a dead key or a leader key are being processed and are effectively
    -- holding input pending the result of input composition, change the cursor
    -- to this color to give a visual cue about the compose state.
    compose_cursor = 'orange',

    -- Colors for copy_mode and quick_select
    -- available since: 20220807-113146-c2fee766
    -- In copy_mode, the color of the active text is:
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    copy_mode_active_highlight_bg = { Color = '#000000' },
    -- use `AnsiColor` to specify one of the ansi color palette values
    -- (index 0-15) using one of the names "Black", "Maroon", "Green",
    --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
    -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

    quick_select_label_bg = { Color = 'peru' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { AnsiColor = 'Navy' },
    quick_select_match_fg = { Color = '#ffffff' },
  },
  ['ow-the-edge-old'] = {
    foreground = inca_yellow,      -- terminal:foreground --editor text
    background = dark_matter,      -- terminal:background --obvious
    cursor_bg = lead,              -- terminal:cursor --excludes editor
    cursor_fg = butterscotch_cake, -- terminal:cursorAccent --excludes editor
    selection_bg = lead,           -- terminal:selection
    selection_fg = plum,           -- Assumed, not provided in the original

    ansi = {
      yippie_ya_yellow,   -- terminal:black --tmux status text, network drive text, kak clippy text
      bluetiful,          -- terminal:red --error text, kak colon
      red_alert,          -- terminal:green --links, tmux status, time seperators, highlight
      peri_peri,          -- terminal:yellow --kak clippy bg
      deviled_eggs,       -- terminal:blue --document selection, text inside highlight,  sel in kak
      falu_red,           -- terminal:magenta --right prompt
      cherry_soda,        -- terminal:cyan --external commands, comments, directories
      federation_of_love, -- terminal:white --cursor, kak command highlight, table lines
    },

    brights = {
      beloved_sunflower,  -- terminal:brightBlack --autocomplete suggestion
      red_pegasus,        -- terminal:brightRed
      inca_yellow,        -- terminal:brightGreen --left prompt, arguments, tab selection, table ids
      red_alert,          -- rterminal:brightYellow
      red_pegasus,        -- terminal:brightBlue --option
      resplendent_growth, -- terminal:brightMagenta --error detail text
      red_pegasus,        -- terminal:brightCyan --internal commands
      finder,             -- terminal:brightWhite
    },

    -- Additional colors (if needed for UI elements)
    tab_bar = {
      background = dwarf_fortress, -- main-dark
      active_tab = {
        bg_color = "#08c",         -- primary
        fg_color = "#fff",         -- text-light
      },
      inactive_tab = {
        bg_color = "#2E3338", -- main-light
        fg_color = "#888",    -- text-dark
      },
      inactive_tab_hover = {
        bg_color = "#2E3338", -- main-light
        fg_color = "#ddd",    -- text
      },
      new_tab = {
        bg_color = dwarf_fortress, -- main-dark
        fg_color = "#ddd",         -- text
      },
      new_tab_hover = {
        bg_color = "#2E3338", -- main-light
        fg_color = "#fff",    -- text-light
      },
    }
  },
  ['HaX0R_R3D5'] = {
    foreground = inca_yellow,         -- terminal:foreground --editor text
    background = dark_matter,         -- terminal:background --obvious
    cursor_bg = federation_of_love,   -- terminal:cursor --excludes editor
    cursor_fg = butterscotch_cake,    -- terminal:cursorAccent --excludes editor
    selection_bg = beloved_sunflower, -- terminal:selection
    selection_fg = finder,            -- Assumed, not provided in the original

    ansi = {
      dwarf_fortress,     -- terminal:black --network drive text, kak clippy text
      bluerocratic,       -- terminal:red --error text
      red_alert,          -- terminal:green --links, tmux status, time seperators, highlight
      peri_peri,          -- terminal:yellow --kak clippy bg
      deviled_eggs,       -- terminal:blue --text inside highlight, x sel in kak
      falu_red,           -- terminal:magenta --right prompt
      cherry_soda,        -- terminal:cyan --external commands, comments, directories
      federation_of_love, -- terminal:white --cursor, kak command highlight, table lines
    },

    brights = {
      beloved_sunflower,  -- terminal:brightBlack --autocomplete suggestion
      red_pegasus,        -- terminal:brightRed
      inca_yellow,        -- terminal:brightGreen --left prompt, arguments, tab selection, table ids
      red_alert,          -- rterminal:brightYellow
      red_pegasus,        -- terminal:brightBlue --option
      resplendent_growth, -- terminal:brightMagenta --error detail text
      red_pegasus,        -- terminal:brightCyan --internal commands
      "#fefefe",          -- terminal:brightWhite
    },

    -- Additional colors (if needed for UI elements)
    tab_bar = {
      background = dwarf_fortress, -- main-dark
      active_tab = {
        bg_color = "#08c",         -- primary
        fg_color = "#fff",         -- text-light
      },
      inactive_tab = {
        bg_color = "#2E3338", -- main-light
        fg_color = "#888",    -- text-dark
      },
      inactive_tab_hover = {
        bg_color = "#2E3338", -- main-light
        fg_color = "#ddd",    -- text
      },
      new_tab = {
        bg_color = dwarf_fortress, -- main-dark
        fg_color = "#ddd",         -- text
      },
      new_tab_hover = {
        bg_color = "#2E3338", -- main-light
        fg_color = "#fff",    -- text-light
      },
    }
  }
}
--config.color_scheme = ''
--config.color_scheme = 'Red Alert'
--config.color_scheme = 'Red Sands'
--config.color_scheme = 'HaX0R_R3D'

config.font                         = wezterm.font 'Monaspace Krypton'

config.tab_bar_at_bottom            = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar            = false
config.window_decorations           = "RESIZE"
config.inactive_pane_hsb            = {
  saturation = 0.9,
  brightness = 0.8,
}

config.wsl_domains                  = {
  {
    -- The name of this specific domain.  Must be unique amonst all types
    -- of domain in the configuration file.
    name = 'WSL:gentoo',

    -- The name of the distribution.  This identifies the WSL distribution.
    -- It must match a valid distribution from your `wsl -l -v` output in
    -- order for the domain to be useful.
    distribution = 'gentoo',

    -- The username to use when spawning commands in the distribution.
    -- If omitted, the default user for that distribution will be used.

    -- username = "hunter",

    -- The current working directory to use when spawning commands, if
    -- the SpawnCommand doesn't otherwise specify the directory.

    default_cwd = "~"

    -- The default command to run, if the SpawnCommand doesn't otherwise
    -- override it.  Note that you may prefer to use `chsh` to set the
    -- default shell for your user inside WSL to avoid needing to
    -- specify it here

    -- default_prog = {"fish"}
  },
}
config.default_domain               = 'WSL:gentoo'
config.window_frame                 = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors                       = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

--config.disable_default_mouse_bindings = true
config.keys                         = {
  { key = 'Backspace', mods = 'CTRL',   action = act.SendKey { key = 'w', mods = 'CTRL' } }, -- https://github.com/wezterm/wezterm/discussions/3983#discussioncomment-6981806
  { key = "S",         mods = "LEADER", action = act { EmitEvent = "save_session" } },
  { key = "L",         mods = "LEADER", action = act { EmitEvent = "load_session" } },
  { key = "R",         mods = "LEADER", action = act { EmitEvent = "restore_session" } },

  -- Switch to the default workspace
  {
    key = 'y',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'default',
    },
  },
  -- Switch to a monitoring workspace, which will have `top` launched into it
  {
    key = 'u',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'monitoring',
      spawn = {
        args = { 'top' },
      },
    },
  },
  -- Create a new workspace with a random name and switch to it
  { key = 'i',          mods = 'CTRL|SHIFT',     action = act.SwitchToWorkspace },
  -- Show the launcher in fuzzy selection mode and have it list all workspaces
  -- and allow activating one.
  {
    key = '9',
    mods = 'ALT',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },

  { key = 'Tab',        mods = 'CTRL',           action = act.ActivateTabRelative(1) },
  { key = 'Tab',        mods = 'SHIFT|CTRL',     action = act.ActivateTabRelative(-1) },
  { key = 'Enter',      mods = 'ALT',            action = act.ToggleFullScreen },
  { key = '!',          mods = 'CTRL',           action = act.ActivateTab(0) },
  { key = '!',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(0) },
  { key = '-',          mods = 'ALT|CTRL',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '-',          mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '#',          mods = 'CTRL',           action = act.ActivateTab(2) },
  { key = '#',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(2) },
  { key = '$',          mods = 'CTRL',           action = act.ActivateTab(3) },
  { key = '$',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(3) },
  { key = '%',          mods = 'CTRL',           action = act.ActivateTab(4) },
  { key = '%',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(4) },
  { key = '|',          mods = 'ALT|CTRL',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '|',          mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '&',          mods = 'CTRL',           action = act.ActivateTab(6) },
  { key = '&',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(6) },
  { key = '\'',         mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '(',          mods = 'CTRL',           action = act.ActivateTab(-1) },
  { key = '(',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(-1) },
  { key = ')',          mods = 'CTRL',           action = act.ResetFontSize },
  { key = ')',          mods = 'SHIFT|CTRL',     action = act.ResetFontSize },
  { key = '*',          mods = 'CTRL',           action = act.ActivateTab(7) },
  { key = '*',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(7) },
  { key = '+',          mods = 'CTRL',           action = act.IncreaseFontSize },
  { key = '+',          mods = 'SHIFT|CTRL',     action = act.IncreaseFontSize },
  { key = '-',          mods = 'CTRL',           action = act.DecreaseFontSize },
  { key = '-',          mods = 'SHIFT|CTRL',     action = act.DecreaseFontSize },
  { key = '-',          mods = 'SUPER',          action = act.DecreaseFontSize },
  { key = '0',          mods = 'CTRL',           action = act.ResetFontSize },
  { key = '0',          mods = 'SHIFT|CTRL',     action = act.ResetFontSize },
  { key = '0',          mods = 'SUPER',          action = act.ResetFontSize },
  { key = '1',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(0) },
  { key = '1',          mods = 'SUPER',          action = act.ActivateTab(0) },
  { key = '2',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(1) },
  { key = '2',          mods = 'SUPER',          action = act.ActivateTab(1) },
  { key = '3',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(2) },
  { key = '3',          mods = 'SUPER',          action = act.ActivateTab(2) },
  { key = '4',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(3) },
  { key = '4',          mods = 'SUPER',          action = act.ActivateTab(3) },
  { key = '5',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(4) },
  { key = '5',          mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '5',          mods = 'SUPER',          action = act.ActivateTab(4) },
  { key = '6',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(5) },
  { key = '6',          mods = 'SUPER',          action = act.ActivateTab(5) },
  { key = '7',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(6) },
  { key = '7',          mods = 'SUPER',          action = act.ActivateTab(6) },
  { key = '8',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(7) },
  { key = '8',          mods = 'SUPER',          action = act.ActivateTab(7) },
  { key = '9',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(-1) },
  { key = '9',          mods = 'SUPER',          action = act.ActivateTab(-1) },
  { key = '=',          mods = 'CTRL',           action = act.IncreaseFontSize },
  { key = '=',          mods = 'SHIFT|CTRL',     action = act.IncreaseFontSize },
  { key = '=',          mods = 'SUPER',          action = act.IncreaseFontSize },
  { key = '@',          mods = 'CTRL',           action = act.ActivateTab(1) },
  { key = '@',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(1) },
  { key = 'C',          mods = 'CTRL',           action = act.CopyTo 'Clipboard' },
  { key = 'C',          mods = 'SHIFT|CTRL',     action = act.CopyTo 'Clipboard' },
  { key = 'F',          mods = 'CTRL',           action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'F',          mods = 'SHIFT|CTRL',     action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'K',          mods = 'CTRL',           action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'K',          mods = 'SHIFT|CTRL',     action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'L',          mods = 'CTRL',           action = act.ShowDebugOverlay },
  { key = 'L',          mods = 'SHIFT|CTRL',     action = act.ShowDebugOverlay },
  { key = 'M',          mods = 'CTRL',           action = act.Hide },
  { key = 'M',          mods = 'SHIFT|CTRL',     action = act.Hide },
  { key = 'N',          mods = 'CTRL',           action = act.SpawnWindow },
  { key = 'N',          mods = 'SHIFT|CTRL',     action = act.SpawnWindow },
  { key = 'P',          mods = 'CTRL',           action = act.ActivateCommandPalette },
  { key = 'P',          mods = 'SHIFT|CTRL',     action = act.ActivateCommandPalette },
  { key = 'R',          mods = 'CTRL',           action = act.ReloadConfiguration },
  { key = 'R',          mods = 'SHIFT|CTRL',     action = act.ReloadConfiguration },
  { key = 'T',          mods = 'CTRL',           action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'T',          mods = 'SHIFT|CTRL',     action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'U',          mods = 'CTRL',           action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
  { key = 'U',          mods = 'SHIFT|CTRL',     action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
  { key = 'V',          mods = 'CTRL',           action = act.PasteFrom 'Clipboard' },
  { key = 'V',          mods = 'SHIFT|CTRL',     action = act.PasteFrom 'Clipboard' },
  { key = 'W',          mods = 'CTRL',           action = act.CloseCurrentTab { confirm = true } },
  { key = 'W',          mods = 'SHIFT|CTRL',     action = act.CloseCurrentTab { confirm = true } },
  { key = 'W',          mods = 'CTRL',           action = act.CloseCurrentPane { confirm = true } },
  { key = 'W',          mods = 'SHIFT|CTRL',     action = act.CloseCurrentPane { confirm = true } },
  { key = 'X',          mods = 'CTRL',           action = act.ActivateCopyMode },
  { key = 'X',          mods = 'SHIFT|CTRL',     action = act.ActivateCopyMode },
  { key = 'Z',          mods = 'CTRL',           action = act.TogglePaneZoomState },
  { key = 'Z',          mods = 'SHIFT|CTRL',     action = act.TogglePaneZoomState },
  { key = '[',          mods = 'SHIFT|SUPER',    action = act.ActivateTabRelative(-1) },
  { key = ']',          mods = 'SHIFT|SUPER',    action = act.ActivateTabRelative(1) },
  { key = '^',          mods = 'CTRL',           action = act.ActivateTab(5) },
  { key = '^',          mods = 'SHIFT|CTRL',     action = act.ActivateTab(5) },
  { key = '_',          mods = 'CTRL',           action = act.DecreaseFontSize },
  { key = '_',          mods = 'SHIFT|CTRL',     action = act.DecreaseFontSize },
  { key = 'c',          mods = 'SHIFT|CTRL',     action = act.CopyTo 'Clipboard' },
  { key = 'c',          mods = 'SUPER',          action = act.CopyTo 'Clipboard' },
  { key = 'f',          mods = 'SHIFT|CTRL',     action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'f',          mods = 'SUPER',          action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'k',          mods = 'SHIFT|CTRL',     action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'k',          mods = 'SUPER',          action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'l',          mods = 'SHIFT|CTRL',     action = act.ShowDebugOverlay },
  { key = 'm',          mods = 'SHIFT|CTRL',     action = act.Hide },
  { key = 'm',          mods = 'SUPER',          action = act.Hide },
  { key = 'n',          mods = 'SHIFT|CTRL',     action = act.SpawnWindow },
  { key = 'n',          mods = 'SUPER',          action = act.SpawnWindow },
  { key = 'p',          mods = 'SHIFT|CTRL',     action = act.ActivateCommandPalette },
  { key = 'r',          mods = 'SHIFT|CTRL',     action = act.ReloadConfiguration },
  { key = 'r',          mods = 'SUPER',          action = act.ReloadConfiguration },
  { key = 't',          mods = 'SHIFT|CTRL',     action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 't',          mods = 'SUPER',          action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'u',          mods = 'SHIFT|CTRL',     action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
  { key = 'v',          mods = 'SHIFT|CTRL',     action = act.PasteFrom 'Clipboard' },
  { key = 'v',          mods = 'SUPER',          action = act.PasteFrom 'Clipboard' },
  { key = 'w',          mods = 'SHIFT|CTRL',     action = act.CloseCurrentTab { confirm = true } },
  { key = 'w',          mods = 'SUPER',          action = act.CloseCurrentTab { confirm = true } },
  { key = 'x',          mods = 'SHIFT|CTRL',     action = act.ActivateCopyMode },
  { key = 'z',          mods = 'SHIFT|CTRL',     action = act.TogglePaneZoomState },
  { key = '{',          mods = 'SUPER',          action = act.ActivateTabRelative(-1) },
  { key = '{',          mods = 'SHIFT|SUPER',    action = act.ActivateTabRelative(-1) },
  { key = '}',          mods = 'SUPER',          action = act.ActivateTabRelative(1) },
  { key = '}',          mods = 'SHIFT|SUPER',    action = act.ActivateTabRelative(1) },
  { key = 'phys:Space', mods = 'SHIFT|CTRL',     action = act.QuickSelect },
  { key = 'PageUp',     mods = 'SHIFT',          action = act.ScrollByPage(-1) },
  { key = 'PageUp',     mods = 'CTRL',           action = act.ActivateTabRelative(-1) },
  { key = 'PageUp',     mods = 'SHIFT|CTRL',     action = act.MoveTabRelative(-1) },
  { key = 'PageDown',   mods = 'SHIFT',          action = act.ScrollByPage(1) },
  { key = 'PageDown',   mods = 'CTRL',           action = act.ActivateTabRelative(1) },
  { key = 'PageDown',   mods = 'SHIFT|CTRL',     action = act.MoveTabRelative(1) },
  { key = 'LeftArrow',  mods = 'SHIFT|CTRL',     action = act.ActivatePaneDirection 'Left' },
  { key = 'LeftArrow',  mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'RightArrow', mods = 'SHIFT|CTRL',     action = act.ActivatePaneDirection 'Right' },
  { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'UpArrow',    mods = 'SHIFT|CTRL',     action = act.ActivatePaneDirection 'Up' },
  { key = 'UpArrow',    mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'DownArrow',  mods = 'SHIFT|CTRL',     action = act.ActivatePaneDirection 'Down' },
  { key = 'DownArrow',  mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'Insert',     mods = 'SHIFT',          action = act.PasteFrom 'PrimarySelection' },
  { key = 'Insert',     mods = 'CTRL',           action = act.CopyTo 'PrimarySelection' },
  { key = 'Copy',       mods = 'NONE',           action = act.CopyTo 'Clipboard' },
  { key = 'Paste',      mods = 'NONE',           action = act.PasteFrom 'Clipboard' },
}

config.key_tables                   = {
  copy_mode = {
    { key = 'Tab',        mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'Tab',        mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'Enter',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape',     mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 'Space',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = '$',          mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '$',          mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = ',',          mods = 'NONE',  action = act.CopyMode 'JumpReverse' },
    { key = '0',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = ';',          mods = 'NONE',  action = act.CopyMode 'JumpAgain' },
    { key = 'F',          mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'F',          mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'G',          mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G',          mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'H',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportTop' },
    { key = 'H',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'L',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'L',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'M',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'M',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'O',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O',          mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'T',          mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'T',          mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'V',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'V',          mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = '^',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = '^',          mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b',          mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',          mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',          mods = 'CTRL',  action = act.CopyMode 'PageUp' },
    { key = 'c',          mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'd',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = (0.5) } },
    { key = 'e',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'f',          mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = false } } },
    { key = 'f',          mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
    { key = 'f',          mods = 'CTRL',  action = act.CopyMode 'PageDown' },
    { key = 'g',          mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'g',          mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'h',          mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'j',          mods = 'NONE',  action = act.CopyMode 'MoveDown' },
    { key = 'k',          mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'l',          mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'm',          mods = 'ALT',   action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'o',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'q',          mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 't',          mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = true } } },
    { key = 'u',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = (-0.5) } },
    { key = 'v',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'v',          mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },
    { key = 'w',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'y',          mods = 'NONE',  action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } } },
    { key = 'PageUp',     mods = 'NONE',  action = act.CopyMode 'PageUp' },
    { key = 'PageDown',   mods = 'NONE',  action = act.CopyMode 'PageDown' },
    { key = 'End',        mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = 'Home',       mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = 'LeftArrow',  mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'LeftArrow',  mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
    { key = 'RightArrow', mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
    { key = 'UpArrow',    mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'DownArrow',  mods = 'NONE',  action = act.CopyMode 'MoveDown' },
  },

  search_mode = {
    { key = 'Enter',     mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'Escape',    mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'n',         mods = 'CTRL', action = act.CopyMode 'NextMatch' },
    { key = 'p',         mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
    { key = 'r',         mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
    { key = 'u',         mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
    { key = 'PageUp',    mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
    { key = 'PageDown',  mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
    { key = 'UpArrow',   mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
  },
}

-- and finally, return the configuration to wezterm
return config
