{ ... }:
{
  nix-config.hosts = {
      nvidia-pc = {
          nixpkgs.packages.unfree = [ "nvidia-x11" "nvidia-settings" ];
          
          nixos.imports = [ ../hardwares/nvidia-pc.nix ];
          kind = "nixos";
          system = "x86_64-linux";
          username = "winston";
          email = "winstonwalter07@gmail.com";
          homeDirectory = "/home/winston";
          tags = {
              cosmic = true;
              desktop = true;
              grub = true;
              media = true;
              games = true;
              wacom = true;
              yggdrasil = true;
          };
      };  
  };
}
