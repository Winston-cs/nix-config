{ ... }:
{
  nix-config.defaultTags = {
    niri = false;
  };

  nix-config.apps.swaylock = {
    tags = [ "niri" ];

    home = { ... }: {
      programs.swaylock = {
        enable = true;
        settings = {
          indicator-idle-visible = false;
          indicator-radius = 100;
          show-failed-attempts = true;
        };
      };    
    };
  };
}
