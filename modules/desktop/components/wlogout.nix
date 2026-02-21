{ ... }: {

    nix-config.defaultTags = {
        niri = false;
    };

    nix-config.apps.wlogout = {
        tags = [ "niri" ];

        home = { ... }: {
           programs.wlogout = {
              enable = true;
              style = ''
                  window {
                      background-color: rgba(129, 51, 184, 0.1);
                  }
              '';
          };     
        };
    };    
}
