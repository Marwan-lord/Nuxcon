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
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.blex-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.ubuntu-mono
      ubuntu-sans
      nerd-fonts._0xproto
      ibm-plex
      nerd-fonts.im-writing
    ];
  };

}
