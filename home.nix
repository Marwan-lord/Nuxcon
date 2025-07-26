{ pkgs, ... }:

{

  imports = [
    ./modules/home/default.nix
  ];

  home.username = "marwan";
  home.homeDirectory = "/home/marwan";
  home.stateVersion = "25.05";

  home.nu.enable = true;
  home.helix.enable = true;

  home.packages = with pkgs; [
    sbcl
    kdePackages.kate
  ];

  home.file = { };
  programs.home-manager.enable = true;
}
