{ ... }:
{

  # TODO: add HSR
  
  nix-config.defaultTags = {
    games = false;
  };

  nix-config.apps.games = {
    tags = [ "games" ];

    nixpkgs.packages.unfree = [
      "lunarclient"
      "steam"
      "prismlauncher"
      "steam-unwrapped"
      "vesktop"
    ];

    nixos = { host, ... }: {
      programs = {
        steam.enable = true;
        steam.gamescopeSession.enable = true;
        gamemode.enable = true;
      };

      services.ratbagd.enable = true;

      environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${host.homeDirectory}/.steam/root/compatibilitytools.d";
      };
    };

    home = { pkgs, ... }: {
      home.packages = with pkgs; [
        prismlauncher
        lunar-client
        mangohud
        vesktop
        protonup-ng
        piper
      ];
    };
  };
}
