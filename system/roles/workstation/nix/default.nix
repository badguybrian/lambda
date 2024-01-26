{ config, 
  lib, 
  pkgs, 
  ... }: {

    nixpkgs = {

    config = {
      allowUnfree = true; # really a pain in the ass to deal with when disabled
      allowBroken = false;
      allowUnsupportedSystem = true;
      permittedInsecurePackages = ["electron-25.9.0"]; # default to none, add more as necessary
    };
  };

  documentation = {
    doc.enable = false;
    nixos.enable = true;
    info.enable = false;
    man = {
      enable = true;
      generateCaches = true;
    };
  };

     nix = {
       settings = {
        extra-experimental-features = [
        "flakes" # flakes
        "nix-command" # experimental nix commands
        "recursive-nix" # let nix invoke itself
        "ca-derivations" # content addressed nix
        "repl-flake" # allow passing installables to nix repl
      ];
      auto-optimise-store = true;
      keep-going = true;
      sandbox = true;
      warn-dirty = false;
      accept-flake-config = true;
      max-jobs = "auto";
     };
     # Collect Stuff that i don't use anymore 
    gc = {
      automatic = true;
      dates = "Mon *-*-* 18:00";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
      dates = ["19:00"];
    };
   };
}
