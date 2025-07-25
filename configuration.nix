{ pkgs, ... }:
{
  imports = [
    ./modules/default.nix
    ./modules/home/stylix.nix
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
    nh
    nixfmt-rfc-style
    lf
    git
    gnumake
    cmake
    bat
    htop
    gdb
    bacon
    lazygit
    qalculate-gtk
    nixd
    astyle
    p7zip
    unzip
    home-manager
  ];

  services.upower.enable = true;
  system.stateVersion = "25.05";
}
