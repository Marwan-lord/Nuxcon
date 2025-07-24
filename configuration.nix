{ pkgs, ... }:
{
  imports = [
    ./modules/default.nix
  ];

  nix-ld.enable = false;
  fonts.enable = true;
  plasma.enable = false;
  intel.enable = true;
  emacs.enable = false;

  networking.hostName = "nixos";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  hardware.bluetooth.enable = true;

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
    qalculate-qt
    nixd
    astyle
    wezterm
    p7zip
    unzip
    home-manager
    mupdf
    libnotify
  ];
  system.stateVersion = "25.05";
}
