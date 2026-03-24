{ inputs, ... }:
{  
    # nix-config.modules.nixos = [
    #   inputs.nixos-hardware.nixosModules.asus-zephyrus-ga402x-amdgpu
    # ];

    nix-config.hosts = {
        rog = {
            nixos.imports = [ ../hardwares/rog.nix ];
            
            kind = "nixos";
            system = "x86_64-linux";
            username = "winston";
            email = "winstonwalter07@gmail.com";
            homeDirectory = "/home/winston";
            tags = {
                academic = true;
                dev = true; # enable 
                efi = true;
                laptop = true;
                media = true;
                niri = true; # enable niri and other things like xremap, etc
                tailscale = true;
            };
        };
    };
}
