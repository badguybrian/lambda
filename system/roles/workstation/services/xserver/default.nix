{ config, 
  lib,
  pkgs, 
  ... }:
{
   services.xserver.enable = true;
   services.xserver.xkb.layout = "us";
   services.xserver.xkb.options = "";
   services.xserver.displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "catppuccin-sddm-corners";
    };

    environment.systemPackages = [
      pkgs.catppuccin-sddm-corners
      pkgs.libsForQt5.qt5.qtgraphicaleffects
    ];

}
