local wezterm = require("wezterm")

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

return {
    -- FONT
    font = wezterm.font_with_fallback({
        "JetBrainsMono Nerd Font", "FiraCode Nerd Font", "monospace",
    }),
    font_size = 12.0,

    -- COLORS
    color_scheme = "Gruvbox dark, hard (base16)", -- we’ll install schemes in a moment

    -- WINDOW
    -- window_background_opacity = 0.85,
    -- window_background_image = "/run/current-system/sw/share/wallpapers/DarkestHour/contents/images/2560x1600.jpg",

    -- This is better
    background = {
        -- Background image with reduced brightness
        {
            source = { File = "/run/current-system/sw/share/wallpapers/DarkestHour/contents/images/2560x1600.jpg" },
            hsb = { brightness = 0.1 }, -- Adjust brightness to dim the image
        },
        -- Semi-transparent overlay to blend with color scheme
        {
            source = { Color = "rgba(28, 33, 39, 0.7)" }, -- Adjust RGBA as needed
            width = "100%",
            height = "100%",
        },
    },
    window_padding = {
        left   = 10,
        right  = 10,
        top    = 5,
        bottom = 5,
    },

    -- KEYS
    disable_default_key_bindings = false,
    keys = {
        -- CTRL-SHIFT-C/V copy/paste
        { key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
        { key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
        -- split pane (we got tmux for that)
        -- { key = "D", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical{domain="CurrentPaneDomain"} },
        -- { key = "E", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"} },
        { key = "/", mods = "CTRL",       action = wezterm.action.SendKey { key = "_", mods = "CTRL" } },
        { key = "/", mods = "CTRL|ALT",   action = wezterm.action.SendKey { key = "_", mods = "CTRL|ALT" } },
    },

    -- TAB BAR
    -- enable_tab_bar = true,
    -- hide_tab_bar_if_only_one_tab = true,
    -- show_tab_index_in_tab_bar = false,
    -- show_tabs_in_tab_bar = true,
    -- tab_bar_at_bottom = false,
    -- tab_max_width = 25,
    -- use_fancy_tab_bar = true,
    -- window_frame = {
    --     font_size = 10.0, -- affects both title bar & tab bar
    -- },

    use_fancy_tab_bar = false,
    tab_bar_at_bottom = false,
    hide_tab_bar_if_only_one_tab = true,
    show_tab_index_in_tab_bar = false,
    tab_max_width = 32,
    colors = {
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
    },

    set_environment_variables = {
        PS1 =
        "\\[\\e[0;37m\\][\\[\\e[0;36m\\]\\u\\[\\e[0;36m\\]@\\[\\e[0;36m\\]\\h\\[\\e[0;37m\\]:\\[\\e[0;36m\\]\\w\\[\\e[0;37m\\]]\\[\\e[0;36m\\]$ \\[\\e[0m\\]"
    },

    -- Disable the Wayland front‐end entirely:
    enable_wayland = false,

    -- (optional) fall back to software rendering if your GL still misbehaves:
    front_end = "Software",

}
