{ config, 
  pkgs,
  lib, 
  ... 
}:

{ 
  config.options = {
   number = true;
   relativenumber = true;
  };
}
