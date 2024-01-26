{
  nixpkgs,
  self,
  ...
}: let
  inherit (self) inputs;
  system = nixpkgs.lib.nixosSystem;
  workstation = ../system/roles/workstation;
  hw = inputs.nixos-hardware.nixosModules;
  agenix = inputs.agenix.nixosModules.age;
  hmModule = inputs.home-manager.nixosModules.home-manager;

  shared = [agenix];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
    users.lambda = {
      imports = [../homes];

    };
  };
in {
 lambda = system {
  system = "x86_64-linux";
  modules = 
   [
    {networking.hostName = "lambda";}
    ./lambda
    workstation
    hmModule
    {inherit home-manager;}
   ]
  ++ shared;
    specialArgs = {inherit inputs;};
  };
}
