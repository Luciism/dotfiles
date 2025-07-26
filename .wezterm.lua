local wezterm = require("wezterm")

local config = {};

-- APPEARANCE
config.font_size = 12.0;
config.font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "FiraCode Nerd Font", "monospace" })

config.color_scheme = "Gruvbox dark, hard (base16)"
config.background = {
    {
        source = { File = "/run/current-system/sw/share/wallpapers/DarkestHour/contents/images/2560x1600.jpg" },
        hsb = { brightness = 0.1 }, -- Adjust brightness to dim the image
    },
    {
        source = { Color = "rgba(28, 33, 39, 0.7)" }, -- Adjust RGBA as needed
        width = "100%",
        height = "100%",
    }, -- Semi-transparent overlay to blend with color scheme
}

config.window_padding = {
    left   = 10,
    right  = 10,
    top    = 5,
    bottom = 5,
}

-- TAB BAR
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 32
config.colors = {
    tab_bar = {
        background = '#1e1e2e',
        active_tab = {
            bg_color = '#89b4fa',
            fg_color = '#1e1e2e',
            intensity = 'Bold',
        },
        inactive_tab = {
            bg_color = '#313244',
            fg_color = '#cdd6f4',
        },
        inactive_tab_hover = {
            bg_color = '#45475a',
            fg_color = '#f38ba8',
        },
        new_tab = {
            bg_color = '#1e1e2e',
            fg_color = '#89b4fa',
        },
        new_tab_hover = {
            bg_color = '#313244',
            fg_color = '#f38ba8',
        },
    },
}

-- Add padding to minimal dark tabs
wezterm.on('format-tab-title', function(tab, _, _, _, _, _)
    local title = tab.tab_title
    if title and #title > 0 then
        title = title
    else
        title = tab.active_pane.title
    end

    -- Add extra padding around the title
    return string.format('  %s  ', title)
end)

-- KEYS
config.disable_default_key_bindings = false
config.keys = {
    { key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
    { key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
    -- Fixes nvim mappings
    { key = "/", mods = "CTRL",       action = wezterm.action.SendKey { key = "_", mods = "CTRL" } },
    { key = "/", mods = "CTRL|ALT",   action = wezterm.action.SendKey { key = "_", mods = "CTRL|ALT" } },
    -- Fixes tmux mappings
    {
        key = 'LeftArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SendKey { key = 'LeftArrow', mods = 'CTRL|SHIFT' }
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SendKey { key = 'RightArrow', mods = 'CTRL|SHIFT' }
    },
    {
        key = 'UpArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SendKey { key = 'UpArrow', mods = 'CTRL|SHIFT' }
    },
    {
        key = 'DownArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SendKey { key = 'DownArrow', mods = 'CTRL|SHIFT' }
    },
}

-- RENDERING
config.enable_wayland = false

-- OTHER
config.default_prog = { 'bash' }

return config
