{ config,
  lib,
  pkgs,
  ... }: {
  users.users.root = {
   initialPassword = "a";
  };
 }
