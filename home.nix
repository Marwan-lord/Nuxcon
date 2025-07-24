{ pkgs, ... }:

{

  imports = [
    ./modules/home/helix.nix
    ./modules/home/bat.nix
    ./modules/home/bash.nix
    ./modules/home/fuzzel.nix
    ./modules/home/mako.nix
  ];

  home.username = "marwan";
  home.homeDirectory = "/home/marwan";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    sbcl
    fuzzel
    pavucontrol
    brightnessctl
    pw-volume
    mpv
    nautilus
    qview
    swww
    nwg-look
  ];

  home.file = { };
  programs.home-manager.enable = true;
}
