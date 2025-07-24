{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    fonts.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.fonts.enable {
    fonts.packages = [
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.blex-mono
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.ubuntu-mono
      pkgs.ubuntu-sans
      pkgs.nerd-fonts._0xproto
      pkgs.nerd-fonts.im-writing
    ];
  };

}
