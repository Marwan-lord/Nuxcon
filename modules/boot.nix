{ config, lib, ... }:
{

  options = {
    boot.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;

    };
  };

  config = lib.mkIf config.boot.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
