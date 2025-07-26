{
  lib,
  config,
  pkgs,
  ...
}:
{

  options = {
    thunar.enable = lib.mkEnableOption "Enables Thunar";
  };

  config = lib.mkIf config.niri.enable {
    programs.thunar.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
    services.tumbler.enable = true;
  };
}
