{ ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./intel.nix
    ./networking.nix
    ./locale.nix
    ./session.nix
    ./users.nix

    ./desktop/default.nix
    ./programs/default.nix
    ./services/default.nix
  ];
}
