{ pkgs, ... }:
{

  services = {
    gnome.gnome-keyring.enable = true;
  };

  systemd = {
    user.services = {
      polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
      niri-flake-polkit.enable = false;
    };
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    CLUTTER_BACKEND = "wayland";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    GTK_USE_PORTAL = "1";
    LIBVA_DRIVER_NAME = "iHD";
    MOZ_DBUS_REMOTE = "1";
  };

  environment.systemPackages = with pkgs; [
    hypridle
    hyprlock
    playerctl
    wl-clipboard
    wl-clip-persist
    wl-color-picker
    wofi-power-menu
    xwayland-satellite
  ];

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    xwayland.enable = true;
  };

  services.displayManager.ly.enable = true;
  services.dbus.enable = true;
  services.gvfs.enable = true;

}
