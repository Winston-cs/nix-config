{
  config,
  lib,
  pkgs,
  username,
  ...
}:

with lib;

let
    cfg = config.my.desktops.cosmic;
in {
  options = {
    my.desktops.cosmic.enable = mkEnableOption "cosmic";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.cosmic-greeter.enable = mkForce true;
    services.desktopManager.cosmic.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
