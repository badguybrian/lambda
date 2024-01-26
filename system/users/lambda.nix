{ config,
  pkgs,
  lib,
  ... }: {
   users.users.lambda = {
     isNormalUser = true;
     initialPassword = "a";
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox
     ];
   };
}
