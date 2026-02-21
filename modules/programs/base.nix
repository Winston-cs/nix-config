{ inputs, ... }:
{
  nix-config.defaultTags = {
    laptop = false;
    desktop = false;  
  };

  nix-config.modules.home-manager = [
    inputs.zen-browser.homeModules.default
  ];
  
  nix-config.apps.base = {
    tags = [ "laptop" "desktop" ];

    home = { ... }: {
      programs.zen-browser.enable = true;
    };
  };
}
