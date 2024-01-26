{ config, pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
    pkgs.starship
  ];

    programs.starship.enable = true;
    programs.starship.settings = {
      add_newline = false;
      format = ''
       $character
      '';

      character = {
        success_symbol = "[λ](bold blue)";
        error_symbol = "[λ](bold red)";
      };
    };

      programs.kitty = {
    enable = true;
    font = {
      size = 12;
      name = "IosevkaTerm Nerd Font";
    };

    settings = {
      scrollback_lines = 10000;
      placement_strategy = "center";
      window_padding_width = 10;
      window_margin_width = 10;
      cursor_shape = "underline";
      cursor_blink_interval = "0.5";

      allow_remote_control = "yes";
      enable_audio_bell = "no";
      visual_bell_duration = "0.1";

      copy_on_select = "clipboard";

      selection_foreground = "none";
      selection_background = "none";
      confirm_os_window_close = 0;


      # colors
      background_opacity = "1";
    };

    theme = "Catppuccin-Mocha";
  };
}
