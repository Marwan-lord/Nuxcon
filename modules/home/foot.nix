{ ... }:
{
  programs.foot.enable = true;
  programs.foot.settings = {
    main = {
      pad = "15x15";
    };
    bell = {
      urgent = "no";
      notify = "no";
    };
  };
}
