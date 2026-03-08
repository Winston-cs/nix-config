{ inputs, ... }:
{
  nix-config.defaultTags = {
    xremap = false;
    niri = false;
  };

  nix-config.modules.nixos = [ inputs.xremap-flake.nixosModules.default ];


  # TODO: make this work generally with other DM
  nix-config.apps.xremap = {
    tags = [ "niri" "xremap" ];

    nixos = { pkgs, host, ... }: let

    vol-up = pkgs.callPackage ../../../scripts/audio-increase {};
    vol-down = pkgs.callPackage ../../../scripts/audio-decrease {};
    bright-up = pkgs.callPackage ../../../scripts/brightness-increase {};
    bright-down = pkgs.callPackage ../../../scripts/brightness-decrease {};
    screenshot = pkgs.callPackage ../../../scripts/screenshot {};
    

    in {
      hardware.uinput.enable = true;
      users.groups.input.members = [ host.username ];
      users.groups.uinput.members = [ host.username ];

      services.xremap = {
        enable = true;
        serviceMode = "user";
        userName = host.username;
        withNiri = true;
      };
      
      services.xremap.config = {
        modmap = [
          {
            name = "cap-esc";
            application.only = [ "kitty" ];
            remap."CapsLock" = {
              held = "leftctrl";
              alone = "esc";
              alone_timeout_millis = 150;
            };
          }          
        ];

        keymap = [
          {
            name = "volume + brightness + screenshot";
            remap = {
              "VolumeUp".launch = [ "${vol-up}" ];
              "VolumeDown".launch = [ "${vol-down}" ];
              "F8".launch = [ "${bright-up}" ];
              "F7".launch = [ "${bright-down}" ];
              "F6".launch = [ "${screenshot}" ];
            };
          }  
        ];
      };
    };
  };
}
