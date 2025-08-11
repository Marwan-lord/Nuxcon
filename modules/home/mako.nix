{ lib, config, ... }:
{
  options = {
    home.mako.enable = lib.mkEnableOption "Enables mako";

  };

  config = lib.mkIf config.home.mako.enable {
    services.mako = {
      enable = true;
      settings = {
        format = "<b>%s</b>\\n%b";
        sort = "-time";
        layer = "overlay";
        anchor = "top-center";
        width = 300;
        padding = "10";
        border-size = 1;
        border-radius = 0;
        icons = true;
        default-timeout = 5000;
        ignore-timeout = false;
      };
    };
  };
}
