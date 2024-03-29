{
  pkgs,
  lib,
  config,
  ...
}: let

  cfg = import ./config.nix {inherit config pkgs;};
  waybar_style = import ./style.nix;

in {
    home.packages = with pkgs.python3Packages; [requests];
    programs.waybar = {
      enable = true;
      settings = cfg;
      style = waybar_style;
    };
}
