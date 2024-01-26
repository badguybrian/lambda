{ config,
  pkgs,
  inputs,
  ... }: {
   home.packages = [
    pkgs.vesktop
   ];
}
