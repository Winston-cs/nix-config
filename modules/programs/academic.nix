{ ... }: {
  nix-config.defaultTags = {
    academic = false;
  };

  nix-config.apps.academic = {
    tags = [ "academic" ];

    nixpkgs.packages.unfree = [ "zoom" "zoom-us" "obsidian" ];

    home = { pkgs, ... }: {
      home.packages = with pkgs; [
        libreoffice
        obsidian
        thunderbird
        zoom-us
        zotero
        sioyek
      ];
    };
  };  
}
