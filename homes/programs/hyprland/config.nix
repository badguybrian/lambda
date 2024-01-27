{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

      animations = {
        enabled = true;
        first_launch_animation = false;

        bezier = [
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "eoe, 0.19, 1.0, 0.22, 1.0"
          "overshot, 0.4,0.8,0.2,1.2"
        ];

        animation = [
          "windows, 1, 4, eoe, slide"
          "windowsOut, 1, 4, eoe, slide"
          "border,1,10,default"

          "fade, 1, 10, eoe"
          "fadeDim, 1, 10, eoe"
          "workspaces,1,4,eoe,slidevert"
        ];
      };

    exec-once = [
      "swww init"
      "waybar"
      "lxsession"
    ];      

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 4;
      "col.active_border" = "rgb(f5c2e7) rgb(cba6f7) 270deg";

      resize_on_border = true;
    };

      xwayland = {
        force_zero_scaling = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };

      decoration = {
        # fancy corners
        rounding = 5;

        # blur
        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = 1;
          xray = true;
          contrast = 0.7;
          brightness = 0.8;
        };

        drop_shadow = "no";
        shadow_range = 20;
        shadow_render_power = 5;
        "col.shadow" = "rgba(292c3cee)";
      };

      dwindle = {
        pseudotile = false;
        preserve_split = "yes";
        no_gaps_when_only = false;
      };

    bind = [
     "$mod, Q, killactive"
     "$mod, A, exec, anyrun"
     "$mod, RETURN, exec, kitty"
     "SUPERSHIFT,BracketRight,movetoworkspace,+1" # move focused window to the next ws
     "SUPERSHIFT,BracketLeft,movetoworkspace,-1" # move focused window to the previous ws
     "$mod,mouse_down,workspace,e+1" # move to the next ws
     "$mod,mouse_up,workspace,e-1" # move to the previous ws
     "$mod,BracketLeft, workspace, -1"
     "$mod,BracketRight, workspace, +1"
     "$mod,SPACE,togglefloating"
     "SUPERSHIFT, left, movewindow, l"
     "SUPERSHIFT, right, movewindow, r"
     "SUPERSHIFT, up, movewindow, u"
     "SUPERSHIFT, down, movewindow, d"

     "$mod, Z, exec, grimblast --cursor copy screen"
     "$mod, X, exec, grimblast copy area"
    ];

    bindm = [
      "$mod,mouse:272,movewindow"
      "$mod,mouse:273,resizewindow"
    ];

      input = {
        # keyboard layout
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0.0;
        touchpad = {
          clickfinger_behavior = true;
          tap-to-click = false;
          scroll_factor = 0.5;
        };

      monitor = [
        ",highrr,auto,1"
        "eDP-1,1920x1080,0x0,1" #no screen hz :(
        "HDMI-A-1,1920x1080@60,0x1080,1" #yeay
      ];
  };
};
}
