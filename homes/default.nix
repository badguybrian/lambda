{ config,
  pkgs,
  lib,
  inputs,
  ... }: {

  imports = [
   ./programs
   ./packages
  ];

  home = {
    username = "lambda";
    homeDirectory = "/home/lambda";
    extraOutputsToInstall = ["doc" "devdoc"];
    stateVersion = "23.11";
    pointerCursor = {
     gtk.enable = true;
     # x11.enable = true;
     package = pkgs.bibata-cursors;
     name = "Bibata-Modern-Classic";
     size = 24;
   };
   packages = [
    inputs.unimatrix.packages.x86_64-linux.unimatrix
   ];
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "mocha";
      };
    };
  };

  programs.home-manager.enable = true;

}
