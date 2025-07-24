{
  pkgs,
  config,
  lib,
  ...
}:
{

  options = {
    plasma.enable = lib.mkEnableOption "enables kde plasma";
  };

  config = lib.mkIf config.plasma.enable {
    services.xserver.enable = true;

    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    services.printing.enable = true;
    programs.partition-manager.enable = true;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      kdepim-runtime
      konsole
      oxygen
    ];

  };
}
