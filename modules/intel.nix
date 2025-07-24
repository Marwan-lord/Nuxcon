{
  pkgs,
  config,
  lib,
  ...
}:
{

  options = {
    intel.enable = lib.mkEnableOption "enables intel drivers";

  };

  config = lib.mkIf config.intel.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # For Intel HD/UHD graphics (Broadwell+)
        vaapiIntel # VA-API (Video Acceleration) support
        libvdpau-va-gl # VDPAU (Video Decode) backend for VA-API
        mesa # OpenGL/Vulkan driver
      ];
    };
  };

}
