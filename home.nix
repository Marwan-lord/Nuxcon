{ pkgs, ... }:

{

  imports = [
    ./modules/home/helix.nix
    ./modules/home/bat.nix
    ./modules/home/bash.nix
    ./modules/home/fuzzel.nix
    ./modules/home/mako.nix
    ./modules/home/foot.nix
    ./modules/home/zathura.nix
    ./modules/home/hyprlock.nix
    ./modules/home/nu.nix
    ./modules/home/starship.nix

  ];

  home.username = "marwan";
  home.homeDirectory = "/home/marwan";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    sbcl
  ];

  home.file = { };
  programs.home-manager.enable = true;
}
