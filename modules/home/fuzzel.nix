{
  lib,
  config,
  pkgs,
  ...
}:
{

  options = {
    home.fuzzel.enable = lib.mkEnableOption "Enables fuzzel";
  };

  config = lib.mkIf config.niri.enable {
    programs.fuzzel.enable = true;
    programs.fuzzel.settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        layer = "overlay";
      };
    };

  };
}
