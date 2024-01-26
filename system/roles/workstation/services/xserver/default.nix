{ config, 
  lib,
  pkgs, 
  ... }:
{
    services.xserver.enable = true;
   services.xserver.xkb.layout = "us";
   services.xserver.xkb.options = "";
   services.xserver.displayManager.gdm.enable = true;
   services.xserver.desktopManager.gnome.enable = true;
}
