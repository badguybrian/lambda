{
  mainBar = {
    layer = "top";
    position = "left";
    height = 1070;
    spacing = 2;
    width = 70;
    modules-left = [
                      "custom/menu" 
                      ];
  
      modules-center = [
                        "hyprland/workspaces"
                       ];

      modules-right = [
                       "clock"
                       "backlight"
                       "pulseaudio"
                       "battery"
                      ];

    margin-left = 5;
    margin-right = 5;

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

 pulseaudio = {
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
