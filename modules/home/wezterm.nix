{ ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}
      local act = wezterm.action

      config.color_scheme = 'Jellybeans'
      config.font = wezterm.font('0xProto Nerd Font')
      config.font_size = 13
      config.enable_tab_bar = false
      -- config.window_background_opacity = 0.97

      config.keys = {
        -- Split vertically (new pane below)
        { key = "j", mods = "SHIFT|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }), },
        -- Split horizontally (new pane to the right)
        { key = "l", mods = "SHIFT|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }), },
      }
      return config
    '';

    enableBashIntegration = true;
  };
}
