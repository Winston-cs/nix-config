{ ... }: {
  nix-config.defaultTags = {
    cosmic = false;
  };

  nix-config.apps.cosmic = {
    tags = [ "cosmic" ];

    nixos = { ... }: {
      services.xserver.enable = true;

      services.displayManager.cosmic-greeter.enable = true;
      services.desktopManager.cosmic.enable = true;

      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
