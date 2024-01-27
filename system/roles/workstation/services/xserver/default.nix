{ config, 
  lib,
  pkgs, 
  ... }:
{
   services.xserver.enable = true;
   services.xserver.xkb.layout = "us";
   services.xserver.xkb.options = "";
   services.xserver.desktopManager.gnome.enable = true;
}
