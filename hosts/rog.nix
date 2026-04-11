{ inputs, ... }:
{  
    nix-config.modules.nixos = [
      inputs.nixos-hardware.nixosModules.asus-zephyrus-ga402x-amdgpu
    ];

    nix-config.hosts = {
        rog = {
            nixos.imports = [ ../hardwares/rog.nix ];
            
            kind = "nixos";
            system = "x86_64-linux";
            username = "winston";
            email = "winstonwalter07@gmail.com";
            homeDirectory = "/home/winston";
            tags = {
                niri = true; # enable niri and other things like xremap, etc
                xremap = true;
                dev = true; # enable 
                academic = true;
                media = true;
                muc = true;
                efi = true;
                laptop = true;
                tailscale = true;
                yggdrasil = true;
                i2p = true;
                virtualization = true;
            };
        };
    };
}
