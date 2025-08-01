{
  pkgs,
  ...
}:
{

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/caroline.yaml";
  stylix.image = ../../wallpapers/smoldring-lake.png;
  stylix.polarity = "dark";

  stylix.fonts = {
    sizes.terminal = 13;
    monospace = {
      package = pkgs.ibm-plex;
      name = "IBM Plex Mono";
    };

    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.ubuntu-sans;
      name = "Ubuntu Sans";
    };
  };
}
