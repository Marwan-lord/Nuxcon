{ ... }:
{
  programs.foot.enable = true;
  programs.foot.settings = {
    main = {
      pad = "15x15";
      shell = "nu";

    };
    bell = {
      urgent = "no";
      notify = "no";
    };
  };
}
