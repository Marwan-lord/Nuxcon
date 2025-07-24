{ ... }:
{

  programs.bash = {
    enable = true;
    shellAliases = {
      lsgen = "nix profile history --profile /nix/var/nix/profiles/system";
      delold = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d";
      x = "hx";
    };
  };

}
