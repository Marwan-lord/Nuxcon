{ pkgs, ... }:
{

  users.users.marwan = {
    isNormalUser = true;
    description = "Marwan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      btop
      man-pages
      man-pages-posix
      lshw
      tree
      rust-analyzer
      brave
    ];
  };

}
