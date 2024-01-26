{ config,
  inputs,
  pkgs,
  lib,
  ... 
}: {

 imports = [
   inputs.hyprland.homeManagerModules.default
   ./config.nix
  ];

  home.packages = [
    pkgs.swww
    pkgs.grimblast
  ];

   wayland.windowManager.hyprland = {
    enable = true;
   };
  }
