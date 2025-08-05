{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    emacs.enable = lib.mkEnableOption "enables emacs";
  };

  config = lib.mkIf config.emacs.enable {
    services.emacs = {
      enable = true;
      package = pkgs.emacs-pgtk;
    };
  };
}
