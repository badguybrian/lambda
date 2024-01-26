{ config,
  pkgs,
  lib,
  inputs,
  ... }: {
   environment.systemPackages = with pkgs; [
    wget
    git
    lxde.lxsession
    cinnamon.nemo
    firefox
    neofetch
   ];
  }
