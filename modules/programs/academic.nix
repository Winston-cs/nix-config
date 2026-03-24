{ ... }: {
  nix-config.defaultTags = {
    academic = false;
  };

  nix-config.apps.academic = {
    tags = [ "academic" ];

    nixpkgs.packages.unfree = [ "zoom" "zoom-us" "obsidian" ];

    nixos = { ... }: {
      networking.firewall.allowedTCPPorts = [ 27123 27124 ];
    };

    home = { pkgs, ... }: {
      home.packages = with pkgs; [
        onlyoffice-desktopeditors
        obsidian
        thunderbird
        zoom-us
        zotero
        sioyek
      ];
    };
  };  
}
