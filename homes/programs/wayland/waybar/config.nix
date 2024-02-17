{config,
 pkgs,
 ... }:

{
  mainBar = {
    spacing = 7;
    margin-left = null;
    margin-top = null;
    margin-bottom = null;
    margin-right = 5;
    fixed-center = true;
    exclusive = true;
    position = "left";
    height = 1080;
    width = 70;
    modules-left = [
      "custom/menu"
      "hyprland/workspaces"
     ];

    modules-right = [
      "clock"
      "network"
      "pulseaudio"
      "custom/powermenu"
      ];

    "custom/powermenu" = {
      on-click = "shutdown -h now";
      on-click-right = "reboot";
      format = " ";
    };

    "hyprland/workspaces" = {
      on-click = "activate";
      format = "{icon}";
      active-only = true;
      all-outputs = true;
      format-icons = {
        "1" = "一";
        "2" = "二";
        "3" = "三";
        "4" = "四";
        "5" = "五";
        "6" = "六";
        "7" = "七";
        "8" = "八";
        "9" = "九";
        "10" = "十";
        };
      };

    backlight = {
        format = "{percent}% {icon}";
        format-icons = ["" "" "" "" "" "" "" "" ""];
    };

    "custom/menu" = {
      format = " ";
      tooltip = false;
      on-click = "anyrun";
      on-click-right = "shutdown -h now";
      };

    clock = {
      format = ''
        {:%H
        %M}
      '';
      tooltip-format = ''
        <big>{:%Y %B}</big>
        <tt><small>{calendar}</small></tt>
      '';
    };

      network = let
          nm-editor = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        in {
          format-wifi = "󰤨 ";
          format-ethernet = "󰈀";
          format-alt = "󱛇";
          format-disconnected = "󰤭";
          tooltip-format = "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
          on-click-right = "${nm-editor}";
        };

    pulseaudio = {
      scroll-step = 5;
      tooltip = true;
      tooltip-format = "{volume}";
      on-click = "pavucontrol";
      format = "{icon}";
      format-muted = "󰝟";
      format-icons = {
        default = ["" "" ""];
       };
     };

    battery = {
      states = {
        good = 65;
        warning = 45;
        critical = 5;
     };
   }; 

  };
}
