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
  home.waybar.enable = true;
  home.mako.enable = true;
  home.fuzzel.enable = false;
  home.rofi.enable = true;

  home.packages = with pkgs; [
    sbcl
    swaybg
    kdePackages.kate
  ];

  home.file = { };
  programs.home-manager.enable = true;
}
