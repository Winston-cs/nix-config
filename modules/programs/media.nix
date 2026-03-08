{ ... }: {
  nix-config.defaultTags = {
    media = false;
  };

  nix-config.homeApps = [
    {
      tags = [ "media" ];
      packages = [
        "mpv"
        # "krita"
        "halftone"
        "gthumb"
        "pinta"
      ];
    }
  ];
}
