{ config, pkgs, inputs, ... }: {
 programs.hyprland = {
  package = inputs.hyprland.packages.x86_64-linux.default;
  enable = true;
 };
}
