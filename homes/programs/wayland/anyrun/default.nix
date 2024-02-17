{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        randr
        translate
        websearch
        dictionary
        rink
        shell
      ];

      width.fraction = 0.3;
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = false;
    };

    extraCss = builtins.readFile (./. + "/anyrun.css");

    extraConfigFiles."applications.ron".text = ''
      Config(
        desktop_actions: false,
        max_entries: 5,
        terminal: Some("kitty"),
      )
    '';
  };
}
