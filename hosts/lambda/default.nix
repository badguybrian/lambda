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
   networking.networkmanager.enable = true;

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
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiInstallAsRemovable = true;
        efiSupport = true;
        useOSProber = false;
        theme = pkgs.stdenv.mkDerivation {
          pname = "nixos-grub-theme";
          version = "3.2";
          src = pkgs.fetchurl {
            url = "https://github.com/AdisonCavani/distro-grub-themes/releases/download/v3.2/nixos.tar";
            hash = "sha256-oW5DxujStieO0JsFI0BBl+4Xk9xe+8eNclkq6IGlIBY=";
          };
          unpackPhase = ''mkdir $out && tar -xvf $src -C $out'';
        };
      };

    };

    plymouth = {
      enable = true;
      themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["connect"];})];
      theme = "connect";
     };
  };

  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
