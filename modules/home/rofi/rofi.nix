{
  lib,
  config,
  pkgs,
  ...
}:
{

  options = {
    home.rofi.enable = lib.mkEnableOption "enables rofi";
  };

  config = lib.mkIf config.home.rofi.enable {
    stylix.targets.rofi.enable = false;
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      terminal = "foot";
      extraConfig = {
        show-icons = true;
        font = "IBM Plex Mono 11";
      };
      theme = ./caroline.rasi;
    };
  };
}
