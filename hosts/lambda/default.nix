{
 config,
 lib,
 pkgs,
 ... }: 
{
 imports = [
  ./hardware-configuration.nix
 ];

   system.stateVersion = "24.05";
   time.timeZone = "Asia/Makassar";

   security.rtkit.enable = true;
   sound.enable = lib.mkForce false;
   hardware.pulseaudio.enable = lib.mkForce false;
   services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;
    # jack.enable = true; # (optional)
   };

   services.dbus.enable = true;


   boot = {
    bootspec.enable = true;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4"];
    };

    # use latest kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      # systemd-boot on UEFI
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    plymouth.enable = true;
  };

  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
