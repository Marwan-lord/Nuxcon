{ pkgs, ... }:
{
  imports = [
    ../../modules/default.nix
    ../../modules/home/stylix.nix
    ./hardware.nix
  ];

  nix-ld.enable = true;
  fonts.enable = true;
  plasma.enable = false;
  intel.enable = true;
  emacs.enable = false;
  niri.enable = true;

  networking.hostName = "nixos";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.nh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    helix
    gcc
    ripgrep
    nasm
    glibc
    rustc
    cargo
    rustfmt
    clippy
    nixfmt-rfc-style
    lf
    git
    gnumake
    cmake
    htop
    gdb
    bacon
    lazygit
    nixd
    astyle
    p7zip
    unzip
    home-manager
  ];

  services.upower.enable = true;
  system.stateVersion = "25.05";
}
